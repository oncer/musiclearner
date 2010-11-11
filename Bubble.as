package {
    import org.flixel.*;

    public class Bubble extends FlxSprite
    {
        [Embed(source="data/ball-white.png")] private var ImgBubble:Class;

        private var _note:Note;

        public function Bubble()
        {
            loadGraphic(ImgBubble);
            exists = false;
        }

        public function go(note:Note):void
        {
            _note = note;
            velocity.x = 2.5;
            velocity.y = 0.0;
            x = -width;
            y = 0;
            //TODO
        }

        override public function update():void
        {
            super.update();
        }
    }
}
