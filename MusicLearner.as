package {
    import org.flixel.*;
    [SWF(width="800", height="480", backgroundColor="#000000")] //Set the size and color of the Flash file

    public class MusicLearner extends FlxGame
    {
        public function MusicLearner()
        {
            super(800,480,PlayState,2); // Create a new FlxGame object at 400x240 with 2x pixels then load PlayState
        }
    }
}
