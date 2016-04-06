import peasy.*;

PeasyCam cam;

void setup() {
  size(640, 480, OPENGL);
  fill(200);
  
  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void draw() {
  background(10);
  lights();

  for (int i = 0; i < 6; i++) {
    translate(30, 0, 0);
    box(25, 25, 25);
  }
}

