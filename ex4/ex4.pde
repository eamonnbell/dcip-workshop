import peasy.*;

PeasyCam cam;
int n = 9;

void setup() {
  size(640, 480, OPENGL);
  background(10);

  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void draw() {
  fill(200);
  background(10);
  lights();

  translate(0, 0, 0);
  drawboxes();
}

void drawboxes() {
    
  for (int i = 0; i < n; i++) {
    translate(20, 0, 0);

    pushMatrix();
    for (int j = 0; j < n; j++) {
      translate(0, 20, 0);

      pushMatrix();
      for (int k = 0; k < n; k++) {
        
//        float r = map(i, 0, n, 0, 255);
//        float g = map(j, 0, n, 0, 255);
//        float b = map(k, 0, n, 0, 255);
//        
//        fill(r, g, b);
        
        translate(0, 0, 20);
        box(15, 15, 15);
      }
      popMatrix();
      
    }
    popMatrix();
    
  }
}

