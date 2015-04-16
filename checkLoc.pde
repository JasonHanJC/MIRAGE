public void checkLoc(player p) {

  int locx = int(p.loc.x);
  int locy = int(p.loc.y);

  float locPix = float(locx + locy * width);

  //yellow
  if (yellow_1.hasValue(locPix) == true || yellow_2.hasValue(locPix) == true || yellow_3.hasValue(locPix) == true) {
    p.setAtYellow(true);
  } else {
    p.setAtYellow(false);
  }

  //door
  if (door_0.hasValue(locPix) == true) {
    p.setAtDoor(true);
    p.setDoorNo(0);
  } else if (door_1.hasValue(locPix) == true) {
    p.setAtDoor(true);
    p.setDoorNo(1);
  } else {
    p.setAtDoor(false);
    doorChanged = false;
  }

  //stair
  if (stair_1.hasValue(locPix) == true) {
    p.setAtStair(true);
    p.setStairNo(1);
    pairedStair = stair1.paired;
  } else if (stair_0.hasValue(locPix) == true) {
    p.setAtStair(true);
    p.setStairNo(0);
    pairedStair = stair0.paired;
  } else if (stair_3.hasValue(locPix) == true) {
    p.setAtStair(true);
    p.setStairNo(3);
    pairedStair = stair3.paired;
  } else if (stair_2.hasValue(locPix) == true) {
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
  if (redFinal.hasValue(locPix) == true) {
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

