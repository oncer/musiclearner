package {
    import org.flixel.*;

    public class PlayState extends FlxState
    {
        private var _bubbleGenerator:BubbleGenerator;
        private var _scoreSlider:ScoreSlider;
        private var _paddle:Paddle;

        function PlayState()
        {
            _bubbleGenerator = new BubbleGenerator();
            _scoreSlider = new ScoreSlider();
            _paddle = new Paddle();
        }
        
        override public function create():void
        {
            add(_bubbleGenerator);
            add(_scoreSlider);
            add(_paddle);
        }

        override public function update():void
        {
            super.update();
            FlxU.collide(_bubbleGenerator.bubbles, _paddle);
        }
    }
}
