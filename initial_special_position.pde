void initial_special_position() {
  /*initial special position*/
  specialPTemp = new FloatList();
  leftRed = new FloatList();
  int lrx = 398;
  int lrxMax = 435;
  for (int lry = 409; lry <= 430; lry++) {
    //println("lry= "+ lry + " lrx= " + lrx + " lrxMax " + lrxMax + " size = " + leftRed.size());
    for (; lrx <= lrxMax; lrx++) {
      leftRed.append(float(lrx + lry * width));
    }
    lrx = 398+1;
    lrx = lrx + (lry - 409);
    lrxMax++;
  }

  rightRed = new FloatList();
  int rrx = 121;
  int rrxMax = 158;
  for (int rry = 409; rry <= 430; rry++) {
    for (; rrx <= rrxMax; rrx++) {
      rightRed.append(float(rrx + rry * width));
    }
    rrx = 121-1;
    rrx = rrx - (rry - 409);
    rrxMax--;
  }

  yellow_1 = new FloatList();
  int y1x = 377;
  int y1xMax = 415;
  for (int y1y = 354; y1y <= 374; y1y++) {
    //println("y1y= "+ y1y + " y1x= " + y1x + " y1xMax " + y1xMax + " size = " + yellow_1.size());
    for (; y1x <= y1xMax; y1x++) {
      yellow_1.append(float(y1x + y1y * width));
    }
    y1x = 377+1;
    y1x = y1x + (y1y - 354);
    y1xMax++;
  }  
  yellow_2 = new FloatList();
  int y2x = 168;
  int y2xMax = 206;
  for (int y2y = 263; y2y <= 284; y2y++) {
    //println("y2y= "+ y2y + " y2x= " + y2x + " y2xMax " + y2xMax + " size = " + yellow_2.size());
    for (; y2x <= y2xMax; y2x++) {
      yellow_2.append(float(y2x + y2y * width));
    }
    y2x = 168-1;
    y2x = y2x - (y2y - 263);
    y2xMax--;
  }  
  yellow_3 = new FloatList();
  int y3x = 250;
  int y3xMax = 287;
  for (int y3y = 143; y3y <= 164; y3y++) {
    //println("y3y= "+ y3y + " y3x= " + y3x + " y3xMax " + y3xMax + " size = " + yellow_3.size());
    for (; y3x <= y3xMax; y3x++) {
      yellow_3.append(float(y3x + y3y * width));
    }
    y3x = 250+1;
    y3x = y3x + (y3y - 143);
    y3xMax++;
  }  

  door_1 = new FloatList();
  int d1x = 254;
  int d1xMax = 291;
  for (int d1y = 293; d1y <= 314; d1y++) {
    //println("d1y= "+ d1y + " d1x= " + d1x + " d1xMax " + d1xMax + " size = " + door_1.size());
    for (; d1x <= d1xMax; d1x++) {
      door_1.append(float(d1x + d1y * width));
    }
    d1x = 254-1;
    d1x = d1x - (d1y - 293);
    d1xMax--;
  } 

  door_2 = new FloatList();
  for (int tempx = 332; tempx <= 342; tempx++) {
    for (int tempy = 115; tempy <= 129; tempy++) {
      specialPTemp.append(float(tempx + tempy * width));
    }
  }
  int d2x = 287;
  int d2xMax = 323;
  for (int d2y = 108; d2y <= 129; d2y++) {
    //println("d2y= "+ d2y + " d2x= " + d2x + " d2xMax " + d2xMax + " size = " + door_2.size());
    for (; d2x <= d2xMax; d2x++) {
      if (specialPTemp.hasValue(float(d2x + d2y * width))==false) {
        door_2.append(float(d2x + d2y * width));
      }
    }
    d2x = 287+1;
    d2x = d2x + (d2y - 108);
    d2xMax++;
  }
  specialPTemp.clear();

  redFinal = new FloatList();
  int rfx = 191;
  int rfxMax = 229;
  for (int rfy = 86; rfy <= 107; rfy++) {
    println("rfy= "+ rfy + " rfx= " + rfx + " rfxMax " + rfxMax + " size = " + redFinal.size());
    for (; rfx <= rfxMax; rfx++) {
      redFinal.append(float(rfx + rfy * width));
    }
    rfx = 191+1;
    rfx = rfx + (rfy - 86);
    rfxMax++;
  } 
} 

