package b.oop.practice;

public class Car {
    public String model;
    public int speed;

    public Car(String model, int speed) {
        this.model = model;
        this.speed = speed;
    }

    void accelerate(){
        speed += 10;
    }

    void brake(){
        speed -= 10;
    }

    void printInfo(){
        System.out.printf("모델: %s, 속도: %dkm/h", this.model, this.speed);
    }
}
