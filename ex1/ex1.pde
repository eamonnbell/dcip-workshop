void setup() {
  size(640, 480, P2D);
  background(255, 255, 255);
}

void draw() {
  fill(0, 255, 0);
  rect(10, 10, 50, 50);

  fill(200, 0, 0);
  rect(640 - 50, 480 - 50, 640, 480);

  // for loop syntax for smartypants
  for (int i = 0; i < 25; i++) {
    int top_x = 100 + (i * 5);
    int top_y = 100 + (i * 5);
    int bottom_x = top_x + 15;
    int bottom_y = top_y + 15;
    rect(top_x, top_y, bottom_x, bottom_y);
  }
}

void mouseDragged() {
  int radius; 
  int factor;
  int factor_max = width * height;
  
  factor = mouseX * mouseY;
  radius = int(map(factor, 0, factor_max, 5, 50));
  
  fill(0, 0, 255, 100);
  ellipse(mouseX, mouseY, radius, radius);
}

