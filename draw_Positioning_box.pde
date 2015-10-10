void draw_Positioning_box(){
/*draw Positioning box*/
  stroke(150, 0, 0);
  strokeWeight(1);
  noFill();
  beginShape();
  vertex(121, 409);
  vertex(100, 430);
  vertex(137, 430);
  vertex(158, 409);
  endShape(CLOSE);
  beginShape();
  vertex(398, 410);
  vertex(421, 430);
  vertex(458, 430);
  vertex(435, 410);
  endShape(CLOSE);
  beginShape();
  vertex(191, 86);
  vertex(212, 107);
  vertex(249, 107);
  vertex(229, 86);
  endShape(CLOSE);
  stroke(0, 0, 225);
  strokeWeight(1);
  noFill();
  beginShape();
  vertex(27, 0);
  vertex(27, 480);
  vertex(535, 480);
  vertex(535, 0);
  endShape(CLOSE);
  beginShape();
  vertex(55, 16);
  vertex(55, 470);
  vertex(508, 470);
  vertex(508, 16);
  endShape(CLOSE);
}
