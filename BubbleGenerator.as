package {
    import org.flixel.*;

    public class BubbleGenerator extends FlxSprite
    {
        public function BubbleGenerator()
        {
            createGraphics(400, 190, 0x000000ff);
            this.x = 0;
            this.y = 0;
        }

        override public function update():void
        {
            super.update();
        }
    }
}
