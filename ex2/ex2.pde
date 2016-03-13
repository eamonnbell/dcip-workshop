void setup() {
  size(640, 480, OPENGL);
  background(10);
  lights();
  fill(200);

}

void draw() {
  background(10);
  translate(width/2, height/2, 0);
  rotateX(10);
  rotateY(10);
  rotateZ(20);
  
  box(100, 100, 100);
}


