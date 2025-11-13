package d.Inheritance;

abstract class Amimal5{
    abstract public void run();
    abstract public void sleep();
    abstract public void eat();
}

class Dog5 extends Amimal5{
    @Override
    public void run() {
    }
    @Override
    public void sleep() {
    }
    @Override
    public void eat() {
    }
}

interface  Animal6 {
    public void run();
    public void sleep();
    public void eat();
}

class Dog66 implements Animal6{
    @Override
    public void run() {
        System.out.println("run");
    }
    @Override
    public void sleep() {
        System.out.println("sleep");
    }
    @Override
    public void eat() {
        System.out.println("eat");
    }
}
interface Drawable {
    void draw();
}

class Rectangle6 implements Drawable {
    private int width, height;
    public Rectangle6(int width, int height) {
        this.width = width;
        this.height = height;
    }
    @Override
    public void draw() {
        System.out.println("사각형 그리기!");
    }
}
public class interfaceMain {
    public static void main(String[] args) {
        Animal6 d = new Dog66();
        d.run();
        d.sleep();
        d.eat();
    }
}
