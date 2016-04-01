import peasy.*;

ArrayList<DisplayPrimitive> display_primitives = new ArrayList<DisplayPrimitive>();

PeasyCam cam;
int n = 9;

Table t;

void setup() {
  size(640, 480, OPENGL);
  background(10);
  lights();

  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);

  t = loadTable("data/data.csv", "header");
  
  for (TableRow row : t.rows()) {
    PVector random_location = PVector.random3D();
    random_location.mult(100);
    
    int amount = row.getInt("amount");
    PVector size = new PVector(amount, amount, amount);
    Box b = new Box(random_location, size);
    display_primitives.add(b);
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

class Blob implements DisplayPrimitive {
  PVector location;
  int size;
  
  Blob(PVector location_) {
    location = location_;
    size = 15;
  }
  
  Blob(PVector location_, int size_) {
    location = location_;
    size = size_;
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    sphere(size);
    popMatrix();
  }
}
