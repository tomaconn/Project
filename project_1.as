import flash.events.KeyboardEvent;

myCharacter.scaleX = 0.5;
myCharacter.scaleY = 0.5;
myCharacter.stop();

stage.addEventListener(KeyboardEvent.KEY_DOWN, moveTheCharacter);
stage.addEventListener(KeyboardEvent.KEY_UP, keyUpCharacter);

function keyUpCharacter(event: KeyboardEvent): void {
	myCharacter.gotoAndStop(1);
}

function moveTheCharacter(event: KeyboardEvent): void {
	trace(myCharacter.currentFrame);

	if (event.keyCode == 39) {
		myCharacter.scaleX = 0.5; // Character Scale 1/2 right
		myCharacter.scaleY = 0.5;
		if (myCharacter.currentFrame >= 26) {
			myCharacter.gotoAndPlay(2);
		}
		if (myCharacter.x >= 768) // Dead Zone Right-Hand Side
		{
			myCharacter.x = 768;
			mySky.x -= 3; // Background Parallax Right
			myMountains.x -= 5;
			myHeadstones.x -= 10;
			myPath.x -= 12;
			myBushes.x -= 15;
		}
		myCharacter.x += 5; // Character Walk Right
		myCharacter.play();
	}

	if (event.keyCode == 37) {
		myCharacter.scaleX = -0.5; // Character Scale 1/2 Left
		myCharacter.scaleY = 0.5;
		if (myCharacter.currentFrame >= 26) {
			myCharacter.gotoAndPlay(2);
		}
		if (myCharacter.x <= 256) { // dead Zone Left-Hand Side
			myCharacter.x = 256;
			mySky.x += 3; // Background Parallax Left
			myMountains.x += 5;
			myHeadstones.x += 10;
			myPath.x += 12;
			myBushes.x += 15;
		}
		myCharacter.x -= 5; //Character Walk Left
		myCharacter.play();
	}
}