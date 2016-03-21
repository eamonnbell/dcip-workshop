Table t;

void setup() {
  t = loadTable("data/data.csv", "header");
  
  for (TableRow row : t.rows()) {
    println(row.getInt("amount"));
  }  
}

void draw() {
}

