package {
    import flash.media.*;
    import flash.events.SampleDataEvent;
    import flash.utils.ByteArray;

    public class Instrument
    {
        [Embed(source="data/piano_C4.mp3")]
        public static var PianoC4: Class;
        [Embed(source="data/piano_C5.mp3")]
        public static var PianoC5: Class;

        public static const NUM_PITCHERS:int = 2;

        private var _pitchers: Array;
        private var _nextPitcher: int;

        public function Instrument (soundClass:Class)
        {
            _pitchers = new Array();
            for (var i:int = 0; i < NUM_PITCHERS; i++)
            {
                _pitchers.push(new SoundPitcher(soundClass));
            }
            _nextPitcher = 0;
        }

        private const RATES: Array = new Array(
            220.00/440, 233.08/440, 246.94/440, 261.63/440,
            277.18/440, 293.66/440, 311.13/440, 329.63/440, 
            349.23/440, 369.99/440, 392.00/440, 415.30/440, 

            440.00/440, 466.16/440, 493.88/440, 523.25/440,
            554.37/440, 587.33/440, 622.25/440, 659.26/440,
            698.46/440, 739.99/440, 783.99/440, 830.61/440,
            880.00/440
        );

        public function playNote (pitch: int): void
        {
            if (pitch < 0 || pitch > 24) return;
            var rate:Number = RATES[pitch];
            var p: SoundPitcher = _pitchers[_nextPitcher];
            p.play(rate);
            _nextPitcher++;
            if (_nextPitcher >= NUM_PITCHERS) {
                _nextPitcher = 0;
            }
        }
    }
}
