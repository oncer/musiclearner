package {
    import flash.utils.Dictionary;

    public class NoteTrack
    {
        private var _name:String;
        private var _notes:Array;

        public function NoteTrack(name:String)
        {
            _name = name;
            _notes = new Array();
        }

        public function addNote(_note:Note):void
        {
            _notes.push(_note);
        }

        public function addNotes(notestr:String):void
        {
            var notestr2:Array = notestr.split(" ");
            var mapping:Dictionary = new Dictionary();
            mapping["C"] = 0;
            mapping["C#"] = 1; mapping["Db"] = 1;
            mapping["D"] = 2;
            mapping["D#"] = 3; mapping["Eb"] = 3;
            mapping["E"] = 4; mapping["Fb"] = 4;
            mapping["F"] = 5; mapping["E#"] = 5;
            mapping["F#"] = 6; mapping["Gb"] = 6;
            mapping["G"] = 7;
            mapping["G#"] = 8; mapping["Ab"] = 8;
            mapping["A"] = 9;
            mapping["A#"] = 10; mapping["Bb"] = 10;
            mapping["B"] = 11; mapping["cb"] = 11;
            mapping["c"] = 12; mapping["B#"] = 12;
            mapping["c#"] = 13; mapping["db"] = 13;
            mapping["d"] = 14;
            mapping["d#"] = 15; mapping["eb"] = 15;
            mapping["e"] = 16; mapping["fb"] = 16;
            mapping["f"] = 17; mapping["e#"] = 17;
            mapping["f#"] = 18; mapping["gb"] = 18;
            mapping["g"] = 19;
            mapping["g#"] = 20; mapping["ab"] = 20;
            mapping["a"] = 21;
            mapping["a#"] = 22; mapping["bb"] = 22;
            mapping["b"] = 23;
            mapping["b#"] = 24;

            for each (var s:String in notestr2)
            {
                var value:int = int(s.slice(0,2));
                var pitch:int = mapping[s.slice(2)];
                _notes.push(new Note(value, pitch));
            }
        }
    }
}
