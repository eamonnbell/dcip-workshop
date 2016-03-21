import peasy.*;

ArrayList<Box> boxes = new ArrayList<Box>();

PeasyCam cam;
int n = 3;

void setup() {
  size(640, 480, OPENGL);
  background(10);
  lights();

  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      for (int k = 0; k < n; k++) {
        boxes.add(new Box(new PVector(i * 20, j * 20, k * 20)));
      }
    }
  }
}

void draw() {
  fill(200);
  background(10);
  translate(0, 0, 0);
  
  for (Box b : boxes) {
    b.display();
  }
}

class Box {
  PVector location;
  PVector size;

  Box(PVector location_) {
    location = location_;
    size = new PVector(15, 15, 15);
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    box(size.x, size.y, size.z);
    popMatrix();
  }
}


