package c.oop2.Practice;

public class Book {
    String  title ;
    String author ;
    int price ;
    String isbn;

    //1. Book(String title, String author)
    public Book(String title, String author){
        this(title,author,0, null);
    }
    // 2. Book(String title, String author, int price)
    public Book(String title, String author, int price){
        this(title,author,price, null);
    }
    // 3. Book(String title, String author, int price, String isbn)
    public Book(String title,  String author, int price, String isbn) {
        this.title = title;
        this.author = author;
        this.price = price;
        this.isbn = isbn;
    }
    public void displayInfo() {
        System.out.printf("제목 - %s: %s, 가격: %d원", title, author,price);
        System.out.println();
    }
    public void displayInfo(boolean detailed) {
        displayInfo();
        if (detailed && isbn != null)
            System.out.println(isbn);
    }
    public int applyDiscount(int percent) {
        int amount = price - (price * percent / 100);
        return amount;
    }
    public int applyDiscount(int amount, boolean isPercent) {
        if (isPercent)
            return applyDiscount(amount);
        else
            return price - amount;
    }
    public String getTitle(){
        return title;
    }

    public String getAuthor(){
        return author;
    }

    public int getPrice(){
        return price;
    }

}
