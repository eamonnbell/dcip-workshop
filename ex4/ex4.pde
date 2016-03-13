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
  translate(0, 0, 0);
  drawboxes();
}

void drawboxes() {
  for (int i = 0; i < 6; i++) {
    translate(20, 0);
    
    pushMatrix();
    for (int j = 0; j < 6; j++) {
      translate(0, 20);
      box(15, 15, 15);

    }
    popMatrix();
    
  }
}
