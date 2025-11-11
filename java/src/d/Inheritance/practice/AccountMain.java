package d.Inheritance.practice;

class Account {
    String accountNumber;
    double balance;

    public Account(String accountNumber, int balance) {
        this.accountNumber = accountNumber;
        this.balance = balance;
    }

    public void deposit(double amount){
        balance += amount;
        System.out.println((int) amount + "원 입금");
    }
    public void withdraw(double amount){
        if (balance <= amount) {
            balance -= amount;
            System.out.println( (int) amount + "원 출금");
        }
        else {
            System.out.println("잔액부족");
        }

    }
}
class SavingsAccount extends Account {
    double interestRate ;

    public SavingsAccount(String accountNumber, int balance, double interestRate) {
        super(accountNumber, balance);
        this.interestRate = interestRate;
    }

    public void addInterest(){
        balance = balance + (balance * interestRate );
        System.out.println(  (int) (balance * interestRate ) + " 이자");
    }
}
class CheckingAccount extends Account {
    double overdraftLimit;

    public CheckingAccount(String accountNumber, int balance, double overdraftLimit) {
        super(accountNumber, balance);
        this.overdraftLimit = overdraftLimit;
    }
    @Override
    public void withdraw(double amount){
        if (-overdraftLimit <= balance - amount){
            balance -= amount;
            System.out.println((int) amount + "원 출금");
        }
        else {
            System.out.println("마이너스 한도 초과했습니다. 마이너스 한도 : " + overdraftLimit);
        }
    }
}
public class AccountMain {
    public static void main(String[] args) {
        SavingsAccount savings = new SavingsAccount("SA001", 1000000, 0.03);
        savings.deposit(500000);
        savings.addInterest();
        System.out.println("저축예금 잔액: " + (int) savings.balance);

        CheckingAccount checking = new CheckingAccount("CA001", 100000, 500000);
        checking.withdraw(400000);
        System.out.println("입출금예금 잔액: " + (int) checking.balance);
    }
}
