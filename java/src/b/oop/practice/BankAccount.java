package b.oop.practice;

public class BankAccount {
    public String accountNumber ;
    public int balance ;

    public BankAccount(String accountNumber, int balance) {
        this.accountNumber = accountNumber;
        this.balance = balance;
    }

    void deposit(int amount){
        balance += amount;
    }
    void withdraw(int amount){
        balance -= amount;
    }
    void getBalance(){
        System.out.printf("잔액: %d원",  this.balance);
    }
}
