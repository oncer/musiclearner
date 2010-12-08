package {
    import org.flixel.*;

    public class Paddle extends FlxSprite
    {
        [Embed(source="data/paddle-white.png")] private var ImgPaddle:Class;

        public static const H_OFFSET: int = 30;

        private var startX: int;

        public function Paddle()
        {
            loadGraphic(ImgPaddle);
            this.startX = BubbleGenerator.WIDTH - this.width - H_OFFSET;
            this.x = this.startX;
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

        override public function hitLeft(contact:FlxObject, velocity:Number):void
        {
            if (contact is Bubble)
            {
                var b:Bubble = contact as Bubble;
                b.explode();
            }
            this.x = this.startX;
        }
    }
}
