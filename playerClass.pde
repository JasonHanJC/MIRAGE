class player {

  PVector loc;
  String name;
  int gameDimen;
  int doorNo;
  int stairNo;
  boolean myTurn;
  boolean atDoor;
  boolean atYellow;
  boolean atStair;
  boolean atFinal;

  player(String n, PVector l, int d, boolean m) { 
    this.name = n; 
    this.loc = l; 
    this.gameDimen = d;
    this.myTurn = m;
  }

  PVector getLoc() {
    return loc;
  }

  int getDoorNo() {
    return doorNo;
  }

  int getStairNo() {
    return stairNo;
  }

  int getDimen() {
    return gameDimen;
  }

  boolean ismyTurn() {
    return myTurn;
  }

  boolean isAtDoor() {
    return atDoor;
  }

  boolean isAtYellow() {
    return atYellow;
  }

  boolean isAtStair() {
    return atStair;
  }

  boolean isAtFinal() {
    return atFinal;
  }

  void setDoorNo(int dn) {
    doorNo = dn;
  }

  void setStairNo(int sn) {
    stairNo = sn;
  }

  void setLoc(PVector l) {
    loc = l;
  }

  void setDimen(int d) {
    gameDimen = d;
  }

  void setMyTurn(boolean m) {
    myTurn = m;
  }

  void setAtDoor(boolean dor ) {
    atDoor = dor;
  }

  void setAtYellow(boolean y) {
    atYellow = y;
  }

  void setAtStair(boolean s) {
    atStair = s;
  }

  void setAtFinal(boolean f) {
    atFinal = f;
  }
}

