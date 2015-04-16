public void chooseDoor(player p) { 
  
  color c = #E31D8E;
  color cc = #FFC30E;
  
  noFill();
  strokeWeight(4);
  stroke(c);
  if (doorChanged == false) {
    door0.drawDoor();
    door1.drawDoor();
    if (doorChooseNo == 0) {
      stroke(cc);
      door0.drawDoor();
    }
    if (doorChooseNo == 1) {
      stroke(cc);
      door1.drawDoor();
    }    
  }
}

