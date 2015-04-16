public void playerMove(player p) {

  //println("currentStair = " + currentStair +  " pairedstair = " + pairedStair + "stairPassed: " + stairPassed);
  if (diceThrowed == true) {
    if (p.name == "A") {
      piece1Move();
    } else {
      piece2Move();
    }
  }
  boolean tempAtYellow = p.isAtYellow();
  boolean tempAtDoor = p.isAtDoor();
  boolean tempAtStair = p.isAtStair();

  checkLoc(p);

  //println(p.isAtDoor());
  if (p.getDimen() == 2) {                          //2dview
    map2d.play();
    image(map2d, width/2, height/2, width, height);
  }
  if (p.getDimen() == 3) {                          //3dview
    //map3d.play();
    image(map3d, width/2, height/2, width, height);
  }

  /***************************at yellow***************************/
  if (p.isAtYellow() == true) {
    //p.setAtYellow(true);
    if (tempAtYellow != p.isAtYellow())
      yellowTime++;
    //println("yellowTime = " + yellowTime);
    if (p.getDimen() == 2 && tempYtime != yellowTime && confirmMove == true) {      //2d
      c2to3.play();
      image(c2to3, width/2, height/2, width, height);
      if (c2to3.duration() == c2to3.time()) {
        c2to3.stop();
        p.setDimen(3);
        tempYtime = yellowTime;
        confirmMove = false;
        p.setMyTurn(false);
        if (p.name == "A") {
          playerB.setMyTurn(true);
          diceThrowed = false;
        } else {
          playerA.setMyTurn(true);
          diceThrowed = false;
        }
      }
    }
    //println(tempYtime);
    if (p.getDimen() == 3 && tempYtime != yellowTime && confirmMove == true) {
      //println("yellowTime == " + yellowTime);
      c3to2.play();
      image(c3to2, width/2, height/2, width, height);
      if (c3to2.duration() == c3to2.time()) {
        c3to2.stop();
        p.setDimen(2);
        tempYtime = yellowTime;
        confirmMove = false;
        p.setMyTurn(false);
        if (p.name == "A") {
          playerB.setMyTurn(true);
          diceThrowed = false;
        } else {
          playerA.setMyTurn(true);
          diceThrowed = false;
        }
      }
    }
  } 

  /***************************at door***************************/
  if (p.isAtDoor() == true) {
    chooseDoor(p);

    if (tempAtDoor != p.isAtDoor())
      doorTime++;

    if (p.getDimen() == 2 && tempDtime != doorTime) { 
      door2D.play();
      image(door2D, width/2, height/2, width, height);
      if (door2D.duration() == door2D.time()) {
        door2D.stop();
        tempDtime = doorTime;
      }
    }

    if (p.getDimen() == 3 && tempDtime != doorTime) { 
      door3D.play();
      image(door3D, width/2, height/2, width, height);
      if (door3D.duration() == door3D.time()) {
        door3D.stop();
        tempDtime = doorTime;
      }
    }
  }

  /***************************at stair***************************/
  tempStair = p.stairNo;
  if (p.isAtStair() == true) {
    if (tempAtStair != p.isAtStair())
      stairTime++;
    currentStair = p.stairNo;

    if (stairPassed.get(1) != stairPassed.get(0)) {
      stairChanged = true;
    }
    if (p.getDimen() == 2 && stairChanged == true) { 

      if (pairedStair == stairPassed.get(0)) {
        if (stairPassed.get(1) != stairPassed.get(0)) {
          //println("lam here");
          if (currentStair == 2 || currentStair == 3) {
            //println("haha");
            stop2.play();
            image(stop2, width/2, height/2, width, height);
            if ( stop2.duration() == stop2.time()) {
              stop2.stop();
              if (stairPassed.get(1) == 3) {
                if (playerA.myTurn == true) {
                  playerA.setLoc(stair2.center);
                  piece1x = int(stair2.center.x);
                  piece1y = int(stair2.center.y);
                } else {
                  playerB.setLoc(stair2.center);
                  piece2x = int(stair2.center.x);
                  piece2y = int(stair2.center.y);
                }
              } else {
                if (playerA.myTurn == true) {
                  playerA.setLoc(stair3.center);
                  piece1x = int(stair3.center.x);
                  piece1y = int(stair3.center.y);
                } else {
                  playerB.setLoc(stair3.center);
                  piece2x = int(stair3.center.x);
                  piece2y = int(stair3.center.y);
                }
              }
            }
          } else if (currentStair == 0 || currentStair == 1) {
            stop1.play();
            image(stop1, width/2, height/2, width, height);
            if ( stop1.duration() == stop1.time()) {
              stop1.stop();
              if (stairPassed.get(1) == 1) {
                if (playerA.myTurn == true) {
                  playerA.setLoc(stair0.center);
                  piece1x = int(stair0.center.x);
                  piece1y = int(stair0.center.y);
                } else {
                  playerB.setLoc(stair0.center);
                  piece2x = int(stair0.center.x);
                  piece2y = int(stair0.center.y);
                }
              } else {
                if (playerA.myTurn == true) {
                  playerA.setLoc(stair1.center);
                  piece1x = int(stair1.center.x);
                  piece1y = int(stair1.center.y);
                } else {
                  playerB.setLoc(stair1.center);
                  piece2x = int(stair1.center.x);
                  piece2y = int(stair1.center.y);
                }
              }
            }
          }
        }
      }
    }
  }

  /***************************at final***************************/
  if (p.isAtFinal() == true && winningGame == true) {
    win.play();
    image(win, width/2, height/2, width, height);
    if (p.name == "A") {
      textFont(oswald);
      textSize(75);
      fill(255);
      text("RED", width/2 - 43, height/2 - 40);
    } else {
      textFont(oswald);
      textSize(75);
      fill(255);
      text("BLUE", width/2 - 43, height/2 - 40);
    }
    if (win.duration() == win.time()) {
      stop1.stop();
      gameState = 3;
    }
  }
}

