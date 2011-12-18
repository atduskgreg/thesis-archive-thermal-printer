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
    String[] lines = loadStrings(filePath);
    for(int i = 0; i < lines.length; i+=5){
      Thesis t = new Thesis(int(lines[i]), lines[i+1], lines[i+2]);
      theses.add(t);
    }
  }
  
  void draw() {
    textSize(20);
    // fill(headlineColor);
    text(title, r.x, r.y);
    image(img, r.x, r.y+ 15, 500, 250);
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

