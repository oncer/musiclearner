package {
    import flash.media.*;
    import flash.events.SampleDataEvent;
    import flash.utils.ByteArray;

    public class Instrument
    {
        private const BLOCK_SIZE: int = 3072;

        [Embed(source="data/piano_C4.mp3")]
        public static var PianoC4: Class;
        [Embed(source="data/piano_C5.mp3")]
        public static var PianoC5: Class;

        private var _sample: Sound;
        private var _out: Sound;
        private var _channel: SoundChannel;

        private var _target: ByteArray;
        private var _position: Number;
        private var _rate: Number;

        private const RATES: Array = new Array(
            220.00/440, 233.08/440, 246.94/440, 261.63/440,
            277.18/440, 293.66/440, 311.13/440, 329.63/440, 
            349.23/440, 369.99/440, 392.00/440, 415.30/440, 

            440.00/440, 466.16/440, 493.88/440, 523.25/440,
            554.37/440, 587.33/440, 622.25/440, 659.26/440,
            698.46/440, 739.99/440, 783.99/440, 830.61/440,
            880.00/440
        );


        public function Instrument (soundClass:Class)
        {
            _target = new ByteArray();

            _sample = new soundClass() as Sound;

            _position = 0.0;
            _rate = 1.0;

            _out = new Sound();
            _out.addEventListener(SampleDataEvent.SAMPLE_DATA, sampleData);

            _channel = new SoundChannel();
        }

        public function playNote (pitch: int): void
        {
            if (pitch < 0 || pitch > 24) return;
            _position = 0.0;
            _rate = RATES[pitch];
            _channel.stop();
            _channel = _out.play();
        }

        private function sampleData(event: SampleDataEvent): void
        {
            _target.position = 0;

            var data: ByteArray = event.data;

            var scaledBlockSize: Number = BLOCK_SIZE * _rate;
            var positionInt: int = _position;
            var alpha: Number = _position - positionInt;

            var positionTargetNum: Number = alpha;
            var positionTargetInt: int = -1;

            var need: int = Math.ceil(scaledBlockSize) + 2;
            var read: int = _sample.extract(_target, need, positionInt);
            var n: int = (read == need) ? (BLOCK_SIZE) : (read / _rate);

            var l0: Number;
            var r0: Number;
            var l1: Number;
            var r1: Number;

            for (var i: int = 0; i < n; ++i)
            {
                if (int(positionTargetNum) != positionTargetInt)
                {
                    positionTargetInt = positionTargetNum;

                    _target.position = positionTargetInt << 3;
                    l0 = _target.readFloat();
                    r0 = _target.readFloat();
                    l1 = _target.readFloat();
                    r1 = _target.readFloat();
                }

                data.writeFloat(l0 + alpha * (l1 - l0));
                data.writeFloat(r0 + alpha * (r1 - r0));

                positionTargetNum += _rate;

                alpha += _rate;
                while (alpha >= 1.0) --alpha;
            }

            if (i < BLOCK_SIZE)
            {
                while (i < BLOCK_SIZE)
                {
                    data.writeFloat(0.0);
                    data.writeFloat(0.0);

                    ++i;
                }
            }

            _position += scaledBlockSize;
        }

    }
}
