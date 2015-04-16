void initialPosition() {
  /*initial special position*/
  int lrx = 127;
  int lrxMax = 192;
  for (int lry = 684; lry <= 719; lry++) {
    //println("lry= "+ lry + " lrx= " + lrx + " lrxMax " + lrxMax + " size = " + leftRed.size());
    for (; lrx <= lrxMax; lrx++) {
      leftRed.append(float(lrx + lry * width));
    }
    lrx = 127 - 1;
    lrx = lrx - (lry - 684);
    lrxMax--;
  }

 
  int rrx = 608;
  int rrxMax = 672;
  for (int rry = 685; rry <= 722; rry++) {
    //println("rry= "+ rry + " rrx= " + rrx + " rrxMax " + rrxMax + " size = " + rightRed.size());
    for (; rrx <= rrxMax; rrx++) {
      rightRed.append(float(rrx + rry * width));
    }
    rrx = 608 + 1;
    rrx = rrx + (rry - 685);
    rrxMax++;
  }

  
  int y1x = 166;
  int y1xMax = 231;
  for (int y1y = 587; y1y <= 623; y1y++) {
    //println("y1y= "+ y1y + " y1x= " + y1x + " y1xMax " + y1xMax + " size = " + yellow_1.size());
    for (; y1x <= y1xMax; y1x++) {
      yellow_1.append(float(y1x + y1y * width));
    }
    y1x = 166 - 1;
    y1x = y1x - (y1y - 587);
    y1xMax--;
  }  
  

  int y2x = 529;
  int y2xMax = 592;
  for (int y2y = 430; y2y <= 467; y2y++) {
    //println("y2y= "+ y2y + " y2x= " + y2x + " y2xMax " + y2xMax + " size = " + yellow_2.size());
    for (; y2x <= y2xMax; y2x++) {
      yellow_2.append(float(y2x + y2y * width));
    }
    y2x = 529 + 1;
    y2x = y2x + (y2y - 430);
    y2xMax++;
  }  
  
 
  int y3x = 388;
  int y3xMax = 450;
  for (int y3y = 220; y3y <= 258; y3y++) {
    //println("y3y= "+ y3y + " y3x= " + y3x + " y3xMax " + y3xMax + " size = " + yellow_3.size());
    for (; y3x <= y3xMax; y3x++) {
      yellow_3.append(float(y3x + y3y * width));
    }
    y3x = 250 - 1;
    y3x = y3x - (y3y - 143);
    y3xMax--;
  }  

  int d0x = 379;
  int d0xMax = 446;
  for (int d0y = 478; d0y <= 516; d0y++) {
    //println("d1y= "+ d1y + " d1x= " + d1x + " d1xMax " + d1xMax + " size = " + door_1.size());
    for (; d0x <= d0xMax; d0x++) {
      door_0.append(float(d0x + d0y * width));
    }
    d0x = 379 + 1;
    d0x = d0x + (d0y - 478);
    d0xMax++;
  } 

  for (int tempx = 289; tempx <= 310; tempx++) {
    for (int tempy = 175; tempy <= 197; tempy++) {
      specialPTemp.append(float(tempx + tempy * width));
    }
  }
  int d1x = 324;
  int d1xMax = 384;
  for (int d1y = 162; d1y <= 197; d1y++) {
    //println("d2y= "+ d2y + " d2x= " + d2x + " d2xMax " + d2xMax + " size = " + door_2.size());
    for (; d1x <= d1xMax; d1x++) {
      if (specialPTemp.hasValue(float(d1x + d1y * width))==false) {
        door_1.append(float(d1x + d1y * width));
      }
    }
    d1x = 324 - 1;
    d1x = d1x - (d1y - 162);
    d1xMax--;
  }
  specialPTemp.clear();

 
  int rfx = 493;
  int rfxMax = 557;
  for (int rfy = 123; rfy <= 160; rfy++) {
    //println("rfy= "+ rfy + " rfx= " + rfx + " rfxMax " + rfxMax + " size = " + redFinal.size());
    for (; rfx <= rfxMax; rfx++) {
      redFinal.append(float(rfx + rfy * width));
    }
    rfx = 493 - 1;
    rfx = rfx - (rfy - 123);
    rfxMax--;
  } 
  
 
  int s0x = 247;
  int s0xMax = 312;
  for (int s0y = 330; s0y <= 367; s0y++) {
    //println("s0y= "+ s0y + " rfx= " + s0x + " rfxMax " + s0xMax + " size = " + stair_0.size());
    for (; s0x <= s0xMax; s0x++) {
      stair_0.append(float(s0x + s0y * width));
    }
    s0x = 247 - 1;
    s0x = s0x - (s0y - 330);
    s0xMax--;
  } 
  
 
  int s1x = 163;
  int s1xMax = 227;
  for (int s1y = 305; s1y <= 342; s1y++) {
    //println("rfy= "+ rfy + " rfx= " + rfx + " rfxMax " + rfxMax + " size = " + redFinal.size());
    for (; s1x <= s1xMax; s1x++) {
      stair_1.append(float(s1x + s1y * width));
    }
    s1x = 163 - 1;
    s1x = s1x - (s1y - 305);
    s1xMax--;
  }
  
  int s2x = 594;
  int s2xMax = 658;
  for (int s2y = 249; s2y <= 285; s2y++) {
    //println("rfy= "+ rfy + " rfx= " + rfx + " rfxMax " + rfxMax + " size = " + redFinal.size());
    for (; s2x <= s2xMax; s2x++) {
      stair_2.append(float(s2x + s2y * width));
    }
    s2x = 594 + 1;
    s2x = s2x + (s2y - 249);
    s2xMax++;
  }

  int s3x = 533;
  int s3xMax = 594;
  for (int s3y = 148; s3y <= 184; s3y++) {
    //println("rfy= "+ rfy + " rfx= " + rfx + " rfxMax " + rfxMax + " size = " + redFinal.size());
    for (; s3x <= s3xMax; s3x++) {
      stair_3.append(float(s3x + s3y * width));
    }
    s3x = 533 + 1;
    s3x = s3x + (s3y - 148);
    s3xMax++;
  }

} 

