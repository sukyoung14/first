package c.oop2.Practice;

public class Library {
    Book[] books;
    int bookCount;

    public Library(int capacity){
        books = new Book[capacity];
        bookCount = 0;
    }

    public void addBook(Book book) {
        if(bookCount >= books.length){
            System.out.println("더 이상 책을 추가할 수 없습니다.");
            return;
        }
        books[bookCount] = book;
        bookCount++;
    }

    public void addBook(String title, String author) {
        addBook(new Book(title, author));
    }
    public void addBook(String title, String author, int price){
        addBook(new Book(title, author, price));
    }
    public void displayAllBooks(){
        for(int i = 0; i < bookCount; i++){
            books[i].displayInfo();
        }
    }
    public void searchByTitle(String keyword) {
        for(int i = 0; i < bookCount; i++){
            if (books[i].title.toLowerCase().contains(keyword.toLowerCase())) {
                books[i].displayInfo();
            }
        }
    }

    public void searchByAuthor(String keyword) {
        for(int i = 0; i < bookCount; i++){
            if (books[i].author.toLowerCase().contains(keyword.toLowerCase())) {
                books[i].displayInfo();
            }
        }
    }

    public int getTotalPrice() {
        int totalPrice = 0;
        for(int i = 0; i < bookCount; i++){
            totalPrice  += books[i].price;
        }
        return totalPrice;
    }

    public int getAveragePrice() {
        if (bookCount == 0){
            return 0;
        }
        else {
            return getTotalPrice() / bookCount;
        }
    }

    public int getBookCount() {
        return bookCount;
    }

    public void applyDiscountToAll(int percent){
        for(int i = 0; i < bookCount; i++){
            books[i].price = books[i].applyDiscount(percent);
        }
    }
}
