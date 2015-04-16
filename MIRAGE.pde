import processing.video.*;
import gifAnimation.*;
Movie movie;
Movie c2to3;
Movie c3to2;
Movie door2D;
Movie door3D;
Movie map2d;
Movie intro1;
Movie win;

// rules
Movie toWin;
Gif keyDice;
Gif dice1g;
int EnterCount;
PFont oswald;

//PImage map2d;
PImage map3d;
PImage choosed;
PImage piece1;
PImage piece2;
PImage turnR;
PImage turnB;
int gameState;
int savedTime;
boolean dimension;

//about player
player playerA;
player playerB;
int piece1x;
int piece1y;
int piece2x;
int piece2y;
int playerADimen;
int playerBDimen;
boolean playerAChoose;
boolean playerBChoose;
boolean wrongInput;
Gif keya;
Gif keyb;
boolean stopKey = false; 

//about doors
int numofDoor = 2;
door door0;
door door1;
int doorChooseNo;
boolean doorChanged;
int doorTime;
int tempDtime;

//about stair
int numofStair = 4;
stair stair0;
stair stair1;
stair stair2;
stair stair3;
int currentStair;
int pairedStair;
IntList stairPassed;
boolean stairChanged;
int tempStair;
int stairTime;
Movie stop1;
Movie stop2;

//about yellow
int yellowTime;
int tempYtime;


boolean confirmMove;
boolean winningGame;
boolean normalBlock;

//dice
int diceSize;
int whichDice;
boolean diceThrowed;
Movie dice1;
Movie dice2;
Movie dice3;
Movie dice4;
Movie dice5;
Movie dice6;
int currentDice;

void setup() {
  size(800, 800);
  frameRate(60);
  gameState=0;
  diceSize = 200;
  //  map2d = loadImage("introduction level_map-01.jpg");
  map3d = loadImage("introduction level_map-02.jpg");
  choosed = loadImage("chooseview.jpg");
  movie = new Movie(this, "title.mov");
  map2d = new Movie(this, "bg.mov");
  intro1 = new Movie(this, "intro_23d.mov");
  c2to3 = new Movie(this, "intro_2to3.mov");
  c3to2 = new Movie(this, "3to2.mov");
  door2D = new Movie(this, "door.mov");
  door3D = new Movie(this, "door3d.mov");
  win = new Movie(this, "win.mov");
  piece1 = loadImage("player1.png");
  piece2 = loadImage("player2.png");
  turnR = loadImage("turnR.png");
  turnB = loadImage("turnB.png");
  //font
  oswald = loadFont("Oswald-28.vlw");
  //stop = loadImage("stop.png");
  stop1 = new Movie(this, "staireffect1.mov");
  stop2 = new Movie(this, "staireffect2.mov");
  toWin = new Movie(this, "howwin1.mov");
  keyDice = new Gif(this, "keySpaceTrow.gif");
  dice1g = new Gif(this, "dice.gif");
  keya = new Gif(this, "keya.gif");
  keyb = new Gif(this, "keyb.gif");
  dice1 = new Movie(this, "dice1.mov");
  dice2 = new Movie(this, "dice2.mov");
  dice3 = new Movie(this, "dice3.mov");
  dice4 = new Movie(this, "dice4.mov");
  dice5 = new Movie(this, "dice5.mov");
  dice6 = new Movie(this, "dice6.mov");
  savedTime = millis();
  imageMode(CENTER);

  piece1x = 657;
  piece1y = 704;
  piece2x = 135;
  piece2y = 704;

  EnterCount = 0;

  playerAChoose = true;
  playerBChoose = false;
  wrongInput = false;

  doorChooseNo = 0;
  doorChanged = false;
  stairChanged = false;
  stairTime = 0;

  yellowTime = 0;
  tempYtime = 0;
  doorTime = 0;
  tempDtime = 0;
  whichDice= 7;
  currentDice = 0;

  confirmMove = false;
  winningGame = false;
  normalBlock = true;

  diceThrowed = false;

  /*initial players info*/
  playerA = new player("A", new PVector(0, 0), 0, true);
  playerB = new player("B", new PVector(0, 0), 0, false);

  /*initial doors info*/
  int[] door0V = {
    379, 478, 412, 478, 412, 444, 452, 444, 452, 485, 484, 514, 419, 514, 379, 478
  };
  int[] door1V = {
    320, 128, 360, 128, 360, 161, 388, 161, 349, 197, 310, 197, 310, 174, 320, 166, 320, 128
  };

  door0 = new door(0, door0V, new PVector(433, 496));
  door1 = new door(1, door1V, new PVector(338, 178));

  /*initial stairs info*/
  stair0 = new stair(0, 1, new PVector(262, 347));
  stair1 = new stair(1, 0, new PVector(176, 323));
  stair2 = new stair(2, 3, new PVector(647, 266));
  stair3 = new stair(3, 2, new PVector(581, 167));
  stairPassed = new IntList();
  stairPassed.append(99);
  stairPassed.append(99);
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  //println(winningGame);
  //background(0);
  int passedTime = millis() - savedTime;

  /******************    State 0 Intro    ******************/
  if (gameState == 0) {                        //startvideo
    movie.play();
    image(movie, width/2, height/2, width, height);
    if (movie.time() == movie.duration()) {
      intro1.play();
      image(intro1, width/2, height/2, width, height);
    }
    if (passedTime>43000) {
      gameState = 1;
      //println("p");
    }
  }

  playerA.setLoc(new PVector(piece1x, piece1y));
  //println(playerA.loc);
  playerB.setLoc(new PVector(piece2x, piece2y));
  //println(playerB.loc);


  /***************    State 1 Choose Dimension    ***************/
  if (gameState == 1) {   
    image(toWin, width/2, height/2, width, height);

    if (toWin.time() == toWin.duration()) {
      image(choosed, width/2, height/2, width, height);

      if (playerAChoose == true) {
        textSize(20);
        fill(237, 30, 40);
        text("Red Player Choose Please", 300, 700);
        if (playerADimen != 0) {
          textSize(20);
          fill(255, 0, 0);
          text(playerADimen + "D", width/2, 730);
          if (playerADimen == 2) {
            fill(255, 0, 0, 80);
            strokeWeight(0);
            beginShape();
            vertex(70, 204);
            vertex(463, 204);
            vertex(333, 613);
            vertex(70, 613);
            vertex(70, 204);
            endShape();
          } else if (playerADimen == 3) {
            fill(255, 0, 0, 70);
            strokeWeight(0);
            beginShape();
            vertex(463, 204);
            vertex(730, 204);
            vertex(730, 613);
            vertex(333, 613);
            vertex(463, 204);
            endShape();
          }
        }
      }

      if (playerBChoose == true) {
        textSize(20);
        fill(49, 187, 244);
        text("Blue Player Choose Please", 290, 700);
        if (playerBDimen != 0) {
          textSize(20);
          fill(49, 187, 244);
          text(playerBDimen + "D", width/2, 730);
          if (playerBDimen == 2) {
            fill(42, 171, 266, 80);
            strokeWeight(0);
            beginShape();
            vertex(70, 204);
            vertex(463, 204);
            vertex(333, 613);
            vertex(70, 613);
            vertex(70, 204);
            endShape();
          } else if (playerBDimen == 3) {
            fill(42, 171, 266, 70);
            strokeWeight(0);
            beginShape();
            vertex(463, 204);
            vertex(730, 204);
            vertex(730, 613);
            vertex(333, 613);
            vertex(463, 204);
            endShape();
          }
        }
      }

      if (wrongInput == true) {
        textSize(20);
        fill(255, 239, 0);
        text("Error! Please Input 2 or 3", 280, 760);
      }

      playerA.setDimen(playerADimen);
      //println(playerA.gameDimen);
      playerB.setDimen(playerBDimen);
      //println(playerB.gameDimen);
      if (playerA.gameDimen != 0 && playerB.gameDimen != 0 && EnterCount == 2 )
        gameState = 2;
    } else {
      toWin.play();
      //println("win");
    };
  } else {
    EnterCount = 0;
  }


  /******************  State 2 Game Start  ********************/

  if (gameState == 2) {     

    if (playerA.ismyTurn() == true) {
      println("PlayerA Move");
      playerMove(playerA);

      image(piece2, piece2x, (piece2y - 20), 30, 50);
      image(piece1, piece1x, (piece1y - 20), 30, 50);

      /**   throw dice   **/
      if (diceThrowed == false) {
        image(keyDice, width/2, height/2, 300, 300);
        keyDice.play();
        if (keyDice.currentFrame() == 23) {
          keyDice.stop();
        }
        throwDice();
      } else {

        if (keya.currentFrame() == 74) {
          stopKey = true;
          keya.stop();
        } else if (stopKey == false) {
          keya.play();
          image(keya, width/2, height-85, 130, 130);
        }
      }
      textFont(oswald);
      textSize(30);
      fill(#C1272D);

      image(turnR, width/2, height/2, width, height);
      text(playerA.gameDimen +"D", width/2 - 100, 30);

      if (diceThrowed == true)
        text(currentDice + 1, width/2 + 105, 30);
    }


    if (playerB.ismyTurn() == true) {
      println("PlayerB Move");
      playerMove(playerB);

      image(piece2, piece2x, (piece2y - 20), 30, 50);
      image(piece1, piece1x, (piece1y - 20), 30, 50);
      /**   throw dice   **/
      if (diceThrowed == false) {
        image(keyDice, width/2, height/2, 300, 300);
        keyDice.play();
        if (keyDice.currentFrame() == 23) {
          keyDice.stop();
        }
        throwDice();
      } else {
        if (keyb.currentFrame() == 74) {
          stopKey = true;
          keyb.stop();
        } else if (stopKey == false) {
          keyb.play();
          image(keyb, width/2, height-85, 130, 130);
        }
      }
      textSize(30);
      fill(49, 187, 244);  
      image(turnB, width/2, height/2, width, height);
      text(playerB.gameDimen +"D", width/2 - 100, 30);
      noFill();
      if (diceThrowed == true)
        text(currentDice + 1, width/2 + 105, 30);
    }
  }

  /******************  State 3 Game Start Again  ********************/
  if (gameState == 3) {
    //initial
    piece1x = 657;
    piece1y = 704;
    piece2x = 135;
    piece2y = 704;
    EnterCount = 0;
    playerAChoose = true;
    playerBChoose = false;
    wrongInput = false;
    doorChooseNo = 0;
    doorChanged = false;
    stairChanged = false;
    stairTime = 0;
    yellowTime = 0;
    tempYtime = 0;
    doorTime = 0;
    tempDtime = 0;
    whichDice= 7;
    confirmMove = false;
    winningGame = false;
    normalBlock = true;
    diceThrowed = false;
    playerA.setMyTurn(true);
    playerB.setMyTurn(false);
    EnterCount = 0;
    playerADimen = 0;
    playerBDimen = 0;
    savedTime = millis();
    currentDice = 0;


    gameState = 0;
  }
}

void mouseClicked() {
  if (gameState == 0) {
    movie.pause();
    gameState = 1;
  }
}

void piece1Move() {
  if (keyPressed) {
    if (keyCode == UP ) piece1y -=4;
    if (keyCode == DOWN) piece1y +=4;
    if (keyCode == LEFT) piece1x -=4;
    if (keyCode == RIGHT) piece1x +=4;
  }
}
void piece2Move() {
  if (keyPressed) {
    if (key == 'w' ) piece2y -=4;
    if (key == 's') piece2y +=4;
    if (key == 'a') piece2x -=4;
    if (key == 'd') piece2x +=4;
  }
}

void changeTurn() {
  if (playerA.ismyTurn() == true) {
    playerA.setMyTurn(false);
    playerB.setMyTurn(true);
  } else {
    playerB.setMyTurn(false);
    playerA.setMyTurn(true);
  }
}

void keyPressed() {

  //choose door
  if (gameState == 2 && key == 'C'|| key == 'c') {
    doorChooseNo = (doorChooseNo + 1) % numofDoor;
  }

  if ((playerA.isAtDoor() == true || playerB.isAtDoor() == true ) && gameState == 2 && keyCode == ENTER) {
    doorChanged = true;
    //enter door you wanna go
    switch(doorChooseNo) {
    case 0: 
      if (playerA.myTurn == true) {
        playerA.setLoc(door0.center);
        piece1x = int(door0.center.x);
        piece1y = int(door0.center.y);
        break;
      } else {
        playerB.setLoc(door0.center);
        piece2x = int(door0.center.x);
        piece2y = int(door0.center.y);
        break;
      }

    case 1: 
      if (playerA.myTurn == true) {
        playerA.setLoc(door1.center);
        piece1x = int(door1.center.x);
        piece1y = int(door1.center.y);
        break;
      } else {
        playerB.setLoc(door1.center);
        piece2x = int(door1.center.x);
        piece2y = int(door1.center.y);
        break;
      }
    }
  }


  //confirm winning
  if ((key == 'v' || key == 'V') && (playerA.isAtFinal() == true || playerB.isAtFinal() == true)) {
    winningGame = true;
  }


  //change turn && confirm move
  if ((key == 'v' || key == 'V') && (playerA.isAtFinal() != true && playerA.isAtFinal() != true) && winningGame == false) {
    confirmMove = true;
    stopKey = false;
    if (doorChanged == true || normalBlock == true) {
      changeTurn();
      if (playerA.isAtDoor() == true || playerB.isAtDoor() == true) {
        doorChanged = true;
      } else {
        doorChanged = false;
      }

      confirmMove = false;
      stairTime = 0;
      diceThrowed = false;
    }
  }

  //confirm dimention

  if (gameState == 1 && key == '2') {
    if (playerAChoose == true) {
      playerADimen = 2;
      wrongInput = false;
    } else {
      playerBDimen = 2;
      wrongInput = false;
    }
  } else if (gameState == 1 && key == '3') {
    if (playerAChoose == true) {
      playerADimen = 3;
      wrongInput = false;
    } else {
      playerBDimen = 3;
      wrongInput = false;
    }
  } else {
    wrongInput = true;
  }
  if (gameState == 1 && keyCode == ENTER) {
    if (playerADimen != 0 && playerBDimen != 0)
      EnterCount = 2;
    //println("EnterCount " + EnterCount);
    if (playerAChoose == true) {
      playerAChoose = false;
      playerBChoose = true;
      wrongInput = false;
    } else {
      playerBChoose = false;
      playerAChoose = true;
      wrongInput = false;
    }
  }
  //throwDice
  if (gameState == 2 && key == ' ' && diceThrowed == false) {
    whichDice = int(random(-0.5, 6));
  }
}

