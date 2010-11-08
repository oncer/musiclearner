package {
    import org.flixel.*;

    public class PlayState extends FlxState
    {
        private var _scoreSlider:ScoreSlider;

        function PlayState()
        {
            _scoreSlider = new ScoreSlider();
        }
        
        override public function create():void
        {
            add(_scoreSlider);
        }

        override public function update():void
        {
            super.update();
        }
    }
}
