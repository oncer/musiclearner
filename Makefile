MXMLC = ./fcsh-wrap
OPTIONS = -debug=true -static-link-runtime-shared-libraries=true
FLIXEL = .
SRC = MusicLearner.as PlayState.as ScoreSlider.as\
      BubbleGenerator.as Bubble.as\
      Paddle.as\
      Song.as NoteTrack.as Note.as
MAIN = MusicLearner.as
SWF = MusicLearner.swf

$(SWF) : $(SRC)
	$(MXMLC) $(OPTIONS) -sp $(FLIXEL) -o $(SWF) -- $(MAIN)
