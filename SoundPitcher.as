package {
    import flash.media.*;
    import flash.events.Event;
    import flash.events.SampleDataEvent;
    import flash.utils.ByteArray;

    public class SoundPitcher
    {
        private const BLOCK_SIZE: int = 3072;

        private var _sample: Sound;
        private var _out: Sound;
        private var _channel: SoundChannel;

        private var _target: ByteArray;
        private var _position: Number;
        private var _rate: Number;

        private var _playing: Boolean;

        public function SoundPitcher(soundClass: Class)
        {
            _target = new ByteArray();

            _sample = new soundClass() as Sound;

            _position = 0.0;
            _rate = 1.0;

            _out = new Sound();
            _out.addEventListener(SampleDataEvent.SAMPLE_DATA, sampleData);

            _channel = new SoundChannel();
            _playing = false;
        }

        public function play(rate: Number): void
        {
            _position = 0.0;
            _rate = rate;
            _channel.stop();
            _channel = _out.play();
            _channel.addEventListener(Event.SOUND_COMPLETE, soundCompleteHandler);
            _playing = true;
        }

        public function isPlaying(): Boolean
        {
            return _playing;
        }

        private function soundCompleteHandler(event: Event): void
        {
            _playing = false;
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

            if (n == 0) return;

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
