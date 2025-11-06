package b.oop.practice;

public class Main {
    public static void main(String[] args) {
        Person person = new Person("홍길동", 25);
        person.printInfo();

        Dog dog = new Dog("진돗개", "백구");
        dog.sit();
        dog.hand();
        System.out.println();
        Car car = new Car("Avante", 0);
        car.accelerate();  // 속도 10
        car.accelerate();  // 속도 20
        car.accelerate();  // 속도 30
        car.brake();       // 속도 20
        car.printInfo();   // 모델: Avante, 속도: 20km/h

        BankAccount BankAccount = new BankAccount("12341234", 0);
        BankAccount.deposit(10000);
        BankAccount.withdraw(1000);
        BankAccount.getBalance();

        Counter Counter = new Counter();
        Counter.increment();
        Counter.increment();
        Counter.increment();
        Counter.decrement();
        System.out.println(Counter.count);
        Counter.reset();
        System.out.println(Counter.count);


    }
}
