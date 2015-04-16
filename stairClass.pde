class stair {
  int stairNo;
  int paired;

  stair(int sn, int p) {
    this.stairNo = sn;
    this.paired = p;
  }

  int getStairNo() {
    return stairNo;
  }

  int getPaired() {
    return paired;
  }

  void setStairNo(int sn) {
    this.stairNo = sn;
  }

  void setPaired(int p) {
    this.paired = p;
  }
}

