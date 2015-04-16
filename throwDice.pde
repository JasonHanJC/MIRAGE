void throwDice() {
  if (keyPressed == true && key == ' ') {
    whichDice = int(random(-0.5, 6));
  }
  //println(whichDice);
  if (whichDice == 0) {
    image(dice1, width/2, height/2, diceSize, diceSize);
    dice1.play();
    if (dice1.time() == dice1.duration()) {
      dice1.stop(); 
      diceThrowed = true;
    }
  }
  if (whichDice == 1) {
    image(dice2, width/2, height/2, diceSize, diceSize);
    dice2.play();
    if (dice2.time() == dice2.duration()) {
      dice2.stop(); 
      diceThrowed = true;
    }
  }
  if (whichDice == 2) {
    image(dice3, width/2, height/2, diceSize, diceSize);
    dice3.play();
    if (dice3.time() == dice3.duration()) {
      dice3.stop(); 
      diceThrowed = true;
    }
  }
  if (whichDice == 3) {
    image(dice4, width/2, height/2, diceSize, diceSize);
    dice4.play();
    if (dice4.time() == dice4.duration()) {
      dice4.stop(); 
      diceThrowed = true;
    }
  }
  if (whichDice == 4) {
    image(dice5, width/2, height/2, diceSize, diceSize);
    dice5.play();
    if (dice5.time() == dice5.duration()) {
      dice5.stop(); 
      diceThrowed = true;
    }
  }
  if (whichDice == 5) {
    image(dice6, width/2, height/2, diceSize, diceSize);
    dice6.play();
    if (dice6.time() == dice6.duration()) {
      dice6.stop(); 
      diceThrowed = true;
    }
  }
}

