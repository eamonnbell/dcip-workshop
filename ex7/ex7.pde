Table t;

import peasy.*;

ArrayList<Box> boxes = new ArrayList<Box>();

PeasyCam cam;
int n = 3;

void setup() {
  size(640, 480, OPENGL);
  background(10);

  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  
  t = loadTable("data/data.csv", "header");
  
  for (TableRow row : t.rows()) {
    PVector random_location = PVector.random3D();
    random_location.mult(100);
    
    int amount = row.getInt("amount");
    PVector size = new PVector(amount, amount, amount);
    
    boxes.add(new Box(random_location, size));
  }      
}

void draw() {
  fill(200);
  background(10);
  lights();

  translate(0, 0, 0);
  
  for (Box b : boxes) {
    b.display();
  }
}

class Box {
  PVector location;
  PVector size;

  Box(PVector location_, PVector size_) {
    location = location_;
    size = size_;
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    box(size.x, size.y, size.z);
    popMatrix();
  }
}

