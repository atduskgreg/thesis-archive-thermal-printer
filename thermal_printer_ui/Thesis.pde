class Thesis {
  String title;
  String author;
  int date;
  
  Thesis(int date, String author, String title){
    this.date = date;
    this.title = title;
    this.author = author;
  }
  
  String printString(){
    return (title + "\nby " + author + "\n" + date);
  }
}
