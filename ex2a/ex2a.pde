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

  translate(width/2, height/2, 0);

  rotateX(10);
  rotateY(10);
  rotateZ(20);
  
  box(100, 100, 100);
}


