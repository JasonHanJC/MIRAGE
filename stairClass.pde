class stair {
  int stairNo;
  int paired;
  PVector center;

  stair(int sn, int p, PVector c) {
    this.stairNo = sn;
    this.paired = p;
    this.center = c;
  }

  int getStairNo() {
    return stairNo;
  }

  int getPaired() {
    return paired;
  }

  PVector getCenter() {
    return center;
  }

  void setCenter(PVector c) {
    center = c;
  }

  void setStairNo(int sn) {
    this.stairNo = sn;
  }

  void setPaired(int p) {
    this.paired = p;
  }
}

