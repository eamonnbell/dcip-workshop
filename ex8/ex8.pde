Table t;

import peasy.*;

ArrayList<Box> boxes = new ArrayList<Box>();
ArrayList<Sphere> spheres = new ArrayList<Sphere>();

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
    String kind = row.getString("kind");
    
    
    if (kind.equals("a")) {
      PVector size = new PVector(amount, amount, amount);
      boxes.add(new Box(random_location, size));
    }
    else {
      int size = amount;
      spheres.add(new Sphere(random_location, size));
    }
    
    
  }      
}

void draw() {
  fill(200);
  background(10);
  translate(0, 0, 0);
  lights();
  
  for (Box b : boxes) {
    b.display();
  }
  
  for (Sphere s : spheres) {
    s.display();
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

class Sphere {
  PVector location;
  int size;

  Sphere(PVector location_, int size_) {
    location = location_;
    size = size_;
  }

  void display() {
    noStroke();
    pushMatrix();
    translate(location.x, location.y, location.z);
    sphere(size);
    popMatrix();
    stroke(0,0,0);
  }
}

