import peasy.*;

ArrayList<DisplayPrimitive> display_primitives = new ArrayList<DisplayPrimitive>();

PeasyCam cam;
int n = 9;

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
        PVector location = new PVector(i * 20, j * 20, k * 20);
        Box b = new Box(location);
        
        display_primitives.add(b);       
      }
    }
  }
}

void draw() {
  fill(200);
  background(10);
  translate(0, 0, 0);
  lights();
  
  for (DisplayPrimitive dp : display_primitives) {
    dp.display();
  }
}

interface DisplayPrimitive {
  void display();
}

class Box implements DisplayPrimitive {
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

class Blob implements DisplayPrimitive {
  PVector location;
  int size;
  
  Blob(PVector location_) {
    location = location_;
    size = 15;
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    sphere(size);
    popMatrix();
  }
}


