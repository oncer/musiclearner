package {
    import org.flixel.*;

    public class ScoreSlider extends FlxSprite
    {
        public function ScoreSlider()
        {
            createGraphic(400, 50, 0xffffffff);
            this.x = 0;
            this.y = 190;
        }

        override public function update():void
        {
            super.update();
        }
    }
}
