import peasy.*;

PeasyCam cam;

void setup() {
  size(640, 480, OPENGL);
  background(10);
  lights();
  
    cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void draw() {
  fill(200);
  background(10);

  for (int i = 0; i < 6; i++) {
    translate(30, 0);
    pushMatrix();
    box(25, 25, 25);
    popMatrix();
  }
}

