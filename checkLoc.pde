public void checkLoc(player p) {

  int locx = int(p.loc.x);
  int locy = int(p.loc.y);

  //yellow
  if (locx < 193 && locx > 167 && locy < 622 && locy > 587) {
    p.setAtYellow(true);
  } else if (locx < 592 && locx > 567 && locy < 467 && locy > 431) {
    p.setAtYellow(true);
  } else if (locx < 414 && locx > 389 && locy < 257 && locy > 221) {
    p.setAtYellow(true);
    //println(p.isAtYellow());
  } else {
    p.setAtYellow(false);
  }

  //door
  if (locx < 447 && locx > 419 && locy < 514 && locy > 479) {
    p.setAtDoor(true);
    p.setDoorNo(0);
  } else if (locx < 349 && locx > 326 && locy < 197 && locy > 161) {
    p.setAtDoor(true);
    p.setDoorNo(1);
  } else {
    p.setAtDoor(false);
    doorChanged = false;
  }

  //stair
  if (locx < 187 && locx > 162 && locy < 342 && locy > 305) {
    p.setAtStair(true);
    p.setStairNo(1);
    pairedStair = stair1.paired;
  } else if (locx < 272 && locx > 247 && locy < 366 && locy > 330) {
    p.setAtStair(true);
    p.setStairNo(0);
    pairedStair = stair0.paired;
  } else if (locx < 593 && locx > 568 && locy < 183 && locy > 147) {
    p.setAtStair(true);
    p.setStairNo(3);
    pairedStair = stair3.paired;
  } else if (locx < 657 && locx > 633 && locy < 285 && locy > 249) {
    p.setAtStair(true);
    p.setStairNo(2);
    pairedStair = stair2.paired;
  } else {
    p.setAtStair(false);
  }
  //println(stairTime);
  if (stairTime == 0) {
    stairPassed.set(0, p.stairNo);
    stairPassed.set(1, p.stairNo);
  } else {
    stairPassed.set(1, p.stairNo);
  }
  
  
  //final
  if (locx < 518 && locx > 453 && locy < 159 && locy > 124) {
    p.setAtFinal(true);
  } else {
    p.setAtFinal(false);
  }




  if (p.atDoor == true || p.atYellow == true) {
    normalBlock = false;
  } else {
    normalBlock = true;
  }
}

