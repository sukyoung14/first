package d.Inheritance;

import org.w3c.dom.css.Rect;

abstract class Animal4 {
    String name;

    public Animal4(String name) {
        this.name = name;
    }
    void sleep(){
        System.out.print("sleeping zzz");
    }
    abstract void makeSound();
}

abstract class Shape4 {
    String color;
    public Shape4(String color) {
        this.color = color;
    }
    void displayColor() {
        System.out.println(color);
    }
    abstract public double getArea();
    abstract public double getPerimeter();
}

class Circle4 extends Shape4 {
    double radius;
    public Circle4(String color, double radius) {
        super(color);
        this.radius = radius;
    }

    @Override
    public double getArea() {
        return 3.14 * radius * radius;
    }

    @Override
    public double getPerimeter() {
        return  3.14 * radius;
    }
}

class Rectangle4 extends Shape4 {
    double width;
    double height;
    public Rectangle4(String color, double width, double height) {
        super(color);
        this.width = width;
        this.height = height;
    }

    @Override
    public double getArea() {
        return  width * height;
    }

    @Override
    public double getPerimeter() {
        return   width * height;
    }
}

abstract class Vehicle4 {
    abstract void start();
    abstract void stop();
    abstract int getSpeed();
}

class Car4 extends Vehicle4 {
    int speed;
    @Override
    void start() {
        speed = 30;
        System.out.println("차가 출발했습니다.");
    }

    @Override
    void stop() {
        speed = 0;
        System.out.println("차가 멈췄습니다..");
    }

    @Override
    int getSpeed() {
        return speed;
    }
}
class Bicycle4 extends Vehicle4 {
    int speed;
    @Override
    void start() {
        speed = 10;
        System.out.println("자전거가 출발했습니다.");
    }

    @Override
    void stop() {
        speed = 0;
        System.out.println("자전거가 멈췄습니다..");
    }

    @Override
    int getSpeed() {
        return speed;
    }
}
public class AbstractMain {
    public static void main(String[] args) {
        Shape4 c = new Circle4("red", 5);
        Shape4 r = new Rectangle4("red", 10,10);

        System.out.println(c.getArea());
        System.out.println(r.getArea());
    }
}
