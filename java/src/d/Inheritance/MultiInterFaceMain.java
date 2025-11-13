package d.Inheritance;
class Animal7 {
    public void eat() {
        System.out.println("eating");
    }
}
interface Swimmable {
    void swim();
}
interface Flyable {
    void fly();
}
interface Walkablew {
    void walk();
}
class Duck implements Swimmable, Flyable, Walkablew {
    @Override
    public void swim() {
        System.out.println("오리가 수영합니다");
    }
    @Override
    public void fly() {
        System.out.println("오리가 날아갑니다");
    }
    @Override
    public void walk() {
        System.out.println("오리가 걷습니다");
    }
}
class Fish extends Animal7 implements Swimmable {
    @Override
    public void swim() {
        System.out.println("물고기가 수영합니다");
    }
}

public class MultiInterFaceMain {
    public static void main(String[] args) {
        Duck duck = new Duck();
        Fish fish = new Fish();

        duck.swim();
        duck.fly();
        duck.walk();
        fish.swim();
    }
}
