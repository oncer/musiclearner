package {
    import org.flixel.*;

    public class Bubble extends FlxSprite
    {
        [Embed(source="data/ball-white.png")] private var ImgBubble: Class;

        private var _note: Note;
        private var _generator: BubbleGenerator;

        private const COLORS: Array = new Array(
            0x00ff00, 0x55ff55, 0x0000ff, 0x5555ff,
            0xff0000, 0xffff00, 0xffff55, 0xff7700,
            0xff9944, 0x997700, 0xaa6622, 0xffffff,

            0x00ff00, 0x55ff55, 0x0000ff, 0x5555ff,
            0xff0000, 0xffff00, 0xffff55, 0xff7700,
            0xff9944, 0x997700, 0xaa6622, 0xffffff,

            0x9900ff
        );

        public function Bubble(generator:BubbleGenerator)
        {
            loadGraphic(ImgBubble);
            _generator = generator;
            exists = false;
        }

        public function go(note:Note): void
        {
            _note = note;
            velocity.x = 120.0;
            velocity.y = 0.0;
            x = -width;
            y = BubbleGenerator.HEIGHT - (_note.pitch + 1.5) * height;
            if (_note.pitch >= 0 && _note.pitch <= 24) {
                color = COLORS[_note.pitch];
            } else {
                color = 0x000000;
            }
            exists = true;
        }

        public function explode(): void
        {
            _generator.instrument.playNote(_note.pitch);
            exists = false;
        }

        override public function update(): void
        {
            super.update();
        }
    }
}
