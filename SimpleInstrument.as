package {
    import flash.media.Sound;

    public class SimpleInstrument
    {
        [Embed(source="data/piano_C5_00.mp3")] private static var __piano_00: Class;
        [Embed(source="data/piano_C5_01.mp3")] private static var __piano_01: Class;
        [Embed(source="data/piano_C5_02.mp3")] private static var __piano_02: Class;
        [Embed(source="data/piano_C5_03.mp3")] private static var __piano_03: Class;
        [Embed(source="data/piano_C5_04.mp3")] private static var __piano_04: Class;
        [Embed(source="data/piano_C5_05.mp3")] private static var __piano_05: Class;
        [Embed(source="data/piano_C5_06.mp3")] private static var __piano_06: Class;
        [Embed(source="data/piano_C5_07.mp3")] private static var __piano_07: Class;
        [Embed(source="data/piano_C5_08.mp3")] private static var __piano_08: Class;
        [Embed(source="data/piano_C5_09.mp3")] private static var __piano_09: Class;
        [Embed(source="data/piano_C5_10.mp3")] private static var __piano_10: Class;
        [Embed(source="data/piano_C5_11.mp3")] private static var __piano_11: Class;
        [Embed(source="data/piano_C5_12.mp3")] private static var __piano_12: Class;
        [Embed(source="data/piano_C5_13.mp3")] private static var __piano_13: Class;
        [Embed(source="data/piano_C5_14.mp3")] private static var __piano_14: Class;
        [Embed(source="data/piano_C5_15.mp3")] private static var __piano_15: Class;
        [Embed(source="data/piano_C5_16.mp3")] private static var __piano_16: Class;
        [Embed(source="data/piano_C5_17.mp3")] private static var __piano_17: Class;
        [Embed(source="data/piano_C5_18.mp3")] private static var __piano_18: Class;
        [Embed(source="data/piano_C5_19.mp3")] private static var __piano_19: Class;
        [Embed(source="data/piano_C5_20.mp3")] private static var __piano_20: Class;
        [Embed(source="data/piano_C5_21.mp3")] private static var __piano_21: Class;
        [Embed(source="data/piano_C5_22.mp3")] private static var __piano_22: Class;
        [Embed(source="data/piano_C5_23.mp3")] private static var __piano_23: Class;
        [Embed(source="data/piano_C5_24.mp3")] private static var __piano_24: Class;

        public static const PIANO: Array = new Array(
            __piano_00, __piano_01, __piano_02, __piano_03,
            __piano_04, __piano_05, __piano_06, __piano_07,
            __piano_08, __piano_09, __piano_10, __piano_11,
            __piano_12, __piano_13, __piano_14, __piano_15,
            __piano_16, __piano_17, __piano_18, __piano_19,
            __piano_20, __piano_21, __piano_22, __piano_23,
            __piano_24
        );

        private var sounds: Array;
        public function SimpleInstrument(CLASSES: Array)
        {
            sounds = new Array();
            for (var i:int = 0; i < 24; i++)
            {
                sounds.push(new CLASSES[i] as Sound);
            }
        }

        public function playNote(pitch: int): void
        {
            if (pitch < 0 || pitch > 24) return;
            sounds[pitch].play();
        }
    }
}
