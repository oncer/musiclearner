package {
    import org.flixel.*;

    public class Paddle extends FlxSprite
    {
        [Embed(source="data/paddle-white.png")] private var ImgPaddle:Class;

        public static const H_OFFSET:int = 20;

        public function Paddle()
        {
            loadGraphic(ImgPaddle);
            this.x = BubbleGenerator.WIDTH - this.width - H_OFFSET;
            this.y = 5;
        }

        override public function update():void
        {
            this.y = FlxG.mouse.y - 7;
            if (this.y < 1) {
                this.y = 1;
            }
            if (this.y > BubbleGenerator.HEIGHT - this.height - 1) {
                this.y = BubbleGenerator.HEIGHT - this.height - 1;
            }
            super.update();
        }
    }
}
