class door {

  int doorNo;
  int[] doorVertex;
  PVector center;

  door(int dn, int[] dv, PVector c) {
    this.doorNo = dn;
    this.doorVertex = dv;
    this.center = c;
  }

  int getDoorNo() {
    return doorNo;
  }

  int[] getDoorVertex() {
    return doorVertex;
  }

  PVector getCenter() {
    return center;
  }
  
  
  void setCenter(PVector c){
    center = c;
  }
  
  void setDoorNo(int dn) {
    doorNo = dn;
  }

  void setDoorVertex(int[] dv) {
    doorVertex = dv;
  }
  
  void drawDoor(){
    beginShape();
    for(int i = 0; i < doorVertex.length;i = i + 2){
       vertex(this.doorVertex[i], this.doorVertex[i+1]);
    }
    endShape();
  }
}

