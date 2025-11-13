package d.Inheritance.practice04;
interface Payment{
    void processPayment(int amount);
    String getPaymentMethod();
    default void printReceipt(int amount){
        System.out.println("영수증: "+ amount + "원 - "+ getPaymentMethod() );
    }
}
class CreditCardPayment implements Payment{
    private String cardNumber;

    public CreditCardPayment(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    @Override
    public void processPayment(int amount) {
        System.out.println("신용카드(" + cardNumber + ")로 "+ amount + "원 결제 완료");
    }

    @Override
    public String getPaymentMethod() {
        return "신용카드";
    }
}
class CashPayment implements Payment{
    @Override
    public void processPayment(int amount) {
        System.out.println("현금 "+ amount + "원 결제 완료");
    }

    @Override
    public String getPaymentMethod() {
        return "현금";
    }
}
public class PaymentMain {
    public static void main(String[] args) {
        Payment[] payments = {
                new CreditCardPayment("1234-5678"),
                new CashPayment()
        };

        int amount = 50000;
        for (Payment payment : payments) {
            payment.processPayment(amount);
            payment.printReceipt(amount);
            System.out.println();
        }
    }
}
