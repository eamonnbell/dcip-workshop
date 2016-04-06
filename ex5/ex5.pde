Table t;

void setup() {
  t = loadTable("data/data.csv", "header");
  
  for (TableRow row : t.rows()) {
    // println(row.getString("user"));
    println(row.getInt("tweet_count"));
  }  
}

void draw() {
}

