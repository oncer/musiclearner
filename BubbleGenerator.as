package {
    import org.flixel.*;

    public class BubbleGenerator extends FlxSprite
    {
        public static const WIDTH: int = 400;
        public static const HEIGHT: int = 190;
        public static const MAX_BUBBLES: int = 50;

        public var instrument: SimpleInstrument;
        public var bubbles: FlxGroup;

        private var _timeline: Number;
        private var _nextNoteTime: Number;
        private var _track: NoteTrack;

        private var _nextBubble: int;

        public function BubbleGenerator()
        {
            createGraphic(400, 190, 0xff000000);
            this.x = 0;
            this.y = 0;

            bubbles = new FlxGroup();

            var i:int;
            for (i = 0; i < MAX_BUBBLES; i++)
            {
                bubbles.add(new Bubble(this));
            }

            _nextBubble = 0;

            _timeline = 0.0;
            _track = new NoteTrack("test");
            _track.addNotes("04E 04E 04F 04G 04G 04F 04E 04D 04C 04C 04D 04E 06E 02D 08D");
            _track.addNotes("04E 04E 04F 04G 04G 04F 04E 04D 04C 04C 04D 04E 06D 02C 08C");

            instrument = new SimpleInstrument(SimpleInstrument.PIANO);
            
            _timeline = 0;
            _nextNoteTime = 0;

        }

        override public function update():void
        {
            super.update();
            bubbles.update();
            _timeline += FlxG.elapsed;
            if (_timeline > _nextNoteTime
                && !_track.isFinished())
            {
                var n:Note = _track.getCurrentNote();
                var b:Bubble = bubbles.getFirstAvail() as Bubble;
                b.go(n);
                _nextNoteTime += n.value / 10.0;
                _track.next();
                _nextBubble++;
                if (_nextBubble >= MAX_BUBBLES) {
                    _nextBubble = 0;
                }
            }
        }

        override public function render():void
        {
            bubbles.render();
        }
    }
}
