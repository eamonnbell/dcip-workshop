void setup() {
  size(640, 480, OPENGL);
  background(10);
  lights();
}

void draw() {
  fill(200);
  background(10);

  translate(width/2, height/2, 0);
  rotateZ(radians(mouseY));


  for (int i = 0; i < 6; i++) {
    translate(30, 0);
    pushMatrix();

    rotateX(radians(mouseX));
    box(25, 25, 25);

    popMatrix();
  }
}

