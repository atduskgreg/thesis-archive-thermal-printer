class Thesis {
  String title;
  String author;
  String date;
  
  Thesis(String date, String author, String title){
    this.date = date;
    this.title = title;
    this.author = author;
  }
  
  String printString(){
    return (title + "\nby " + author + "\n" + date);
  }
}
