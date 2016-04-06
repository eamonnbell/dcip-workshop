import peasy.*;

ArrayList<DisplayPrimitive> display_primitives = new ArrayList<DisplayPrimitive>();
ArrayList<PVector> user_locations = new ArrayList<PVector>();
ArrayList<String> usernames = new ArrayList<String>();

PeasyCam cam;

Table t;

void setup() {
  size(640, 480, OPENGL);
  background(10);
  noStroke();

  lights();

  load_data(); 

  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void keyPressed() {
  display_primitives.clear();
  user_locations.clear();
  usernames.clear();
  load_data();
}

void load_data() {
  t = loadTable("data/users.csv", "header");

  for (TableRow row : t.rows ()) {
    PVector random_location = PVector.random3D();
    random_location.mult(200);
    user_locations.add(random_location);

    usernames.add(row.getString("handle"));

    int followers = row.getInt("followers");
    int size = int(map(followers, 268045, 7408194, 25, 50));

    String party = row.getString("party");

    color fill;

    if (party.equals("R")) {
      fill = #ff0000;
    } else {
      fill = #0000ff;
    }

    Blob b = new Blob(random_location, size, fill);
    display_primitives.add(b);
  }

  int u_i = 0;

  for (String username : usernames) {
    String user_data_path = String.format("data/%s.csv", username);
    t = loadTable("data/users.csv", "header");

    PVector user_location = user_locations.get(u_i);
    PVector label_offset = new PVector(65, 0, 0);
    
    TextLabel tl = new TextLabel(PVector.add(user_location, label_offset), username);
    display_primitives.add(tl);

    for (TableRow r : t.rows ()) {

      PVector random_offset = PVector.random3D();
      random_offset.mult(65);

      PVector computed_location = PVector.add(user_location, random_offset);

      color fill = #4099FF;
      int size = 5;

      Blob blob = new Blob(computed_location, size, fill);

      display_primitives.add(blob);
    }

    u_i = u_i + 1;
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
  color fill;

  Box(PVector location_) {
    location = location_;
    size = new PVector(15, 15, 15);
  }

  Box(PVector location_, PVector size_, color fill_) {
    location = location_;
    size = size_;
    fill = fill_;
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    fill(fill);
    box(size.x, size.y, size.z);
    popMatrix();
  }
}

class Blob implements DisplayPrimitive {
  PVector location;
  int size;
  color fill;

  Blob(PVector location_) {
    location = location_;
    size = 15;
  }

  Blob(PVector location_, int size_, color fill_) {
    location = location_;
    size = size_;
    fill = fill_;
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    fill(fill);
    sphere(size);
    popMatrix();
  }
}

class TextLabel implements DisplayPrimitive {
  String label;
  PVector location;
  
  TextLabel(PVector location_, String label_) {
    location = location_;
    label = label_;
  }
  
  void display() {
    pushMatrix();
    fill(#ffffff);
    text(label, location.x, location.y, location.z);
    popMatrix();
  }
}

