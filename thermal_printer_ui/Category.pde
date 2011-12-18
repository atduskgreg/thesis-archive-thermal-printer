class Category {
  Rectangle r;
  PImage img;
  String title;
  ArrayList<Thesis> theses;

  Category(int x, int y, PImage i, String t) {
    this.r = new Rectangle(x, y, i.width, i.height);
    this.title = t;
    this.img = i;
    
    theses = new ArrayList();
  }
  
  void loadTheses(String filePath){
    println("loading: " + filePath);
    String[] lines = loadStrings(filePath);
    for(int i = 0; i < lines.length; i+=4){
      Thesis t = new Thesis(lines[i], lines[i+1], lines[i+2]);
      theses.add(t);
    }
  }
  
  void draw() {
    textSize(30);
    // fill(headlineColor);
    text(title, r.x, r.y - 15);
    image(img, r.x, r.y+ 15, 360, 279);
    stroke(200);
    noFill();
    rect(r.x,r.y+15, 360, 279);
  }
  
  String thesesString(){
    String toPrint = "";
    for(int i = 0; i < theses.size(); i++){
      Thesis t = theses.get(i);
      toPrint = toPrint + t.printString() + "\n\n";
    }
    return toPrint;
  }

  void check() {
    if (r.contains(mouseX, mouseY)) {
      thermalPrintString(thesesString());
    }
  }
}

