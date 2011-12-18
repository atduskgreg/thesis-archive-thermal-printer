import fullscreen.*; 
import processing.opengl.*;
import java.awt.Rectangle;
import processing.serial.*;

Serial port;
FullScreen fs; 

color backgroundColor = color(248, 250, 252);
color headlineColor = color(17,114, 228);

PImage gradient;

ArrayList<Category> categories;

void setup(){
  size(1280,800);
  fs = new FullScreen(this); 
  //fs.enter();
  
  textFont(createFont("Gulim",48));

  gradient = loadImage("gradient3.png");
  
  PImage d = loadImage("diagrams.jpg");
  PImage s = loadImage("screenshot.png");
  PImage t = loadImage("title_page.png");
  
  categories = new ArrayList();
  Category diagrams = new Category(125, 130, d, "Diagrams");
  diagrams.loadTheses("diagrams.txt");
  categories.add(diagrams);
  
  Category screenShots = new Category(650, 130, s, "Screenshots");
  screenShots.loadTheses("screen_shots.txt");
  categories.add(screenShots);
  
  Category titlePages = new Category(425, 450, t, "Title Pages");
  titlePages.loadTheses("title_pages.txt");
  categories.add(titlePages);
  
  String portName = Serial.list()[0];
  port = new Serial(this, portName, 9600);
}

void draw(){
  background(255);
  fill(backgroundColor);
  rect(0,0, width, 100);
  noStroke();
  
  image(gradient, 0,90);
  
  /*
  beginShape(QUADS);
    fill(red(backgroundColor), green(backgroundColor), blue(backgroundColor),0);
    vertex(0,90);
    vertex(width,90);
    fill(200,255);
    vertex(width, 100);
    vertex(0,100 );
  endShape();
  */
  
    fill(20);

  textSize(48);
  text("ITP Thesis Archive", 50, 70); 
  
  stroke(200);
  strokeWeight(1);
  line(0,100, width, 100);  
  noStroke();
  
  for(int i = 0; i < categories.size(); i++){
    Category c = categories.get(i);
    c.draw();
  }
}

void mouseClicked(){  
  for(int i = 0; i < categories.size(); i++){
    Category c = categories.get(i);
    c.check();
  }
}

void thermalPrintString(String toPrint){
  println(toPrint);
  for(int i = 0; i < toPrint.length(); i++){
    port.write((byte)toPrint.charAt(i));
  }
  port.write((byte)1);
}
