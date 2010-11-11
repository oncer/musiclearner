package {
    import org.flixel.*;

    public class BubbleGenerator extends FlxSprite
    {
        public static const WIDTH:int = 400;
        public static const HEIGHT:int = 190;
        public static const MAX_BUBBLES:int = 50;

        private var _bubbles:FlxGroup;
        private var _timeline:Number;
        private var _track:NoteTrack;

        public function BubbleGenerator()
        {
            createGraphic(400, 190, 0xff000000);
            this.x = 0;
            this.y = 0;

            _bubbles = new FlxGroup();

            var i:int;
            for (i = 0; i < MAX_BUBBLES; i++)
            {
                _bubbles.add(new Bubble());
            }

            _timeline = 0.0;
            _track = new NoteTrack("test");
            _track.addNotes("01C 04D 04D 04D 04D 08E 04D 08E 08E 04D 08E");
        }

        override public function update():void
        {
            super.update();
        }
    }
}
