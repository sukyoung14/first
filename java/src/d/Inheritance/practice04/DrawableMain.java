package d.Inheritance.practice04;

interface Drawable{
    void draw();
}
class Circle implements Drawable{
    private int radius;

    public Circle(int radius) {
        this.radius = radius;
    }
    @Override
    public void draw() {
        System.out.println( "반지름 "+ radius+"인 원을 그립니다");
    }
}
class Rectangle implements Drawable{
    private int width, height;

    public Rectangle(int width, int height) {
        this.width = width;
        this.height = height;
    }
    @Override
    public void draw() {
        System.out.println( width + " x " + height + " 사각형을 그립니다");
    }
}
class Triangle implements Drawable{
    private int base, height;
    public Triangle(int base, int height) {
        this.base = base;
        this.height = height;
    }
    @Override
    public void draw() {
        System.out.println( "밑변 " + base + ", 높이 " + height + "인 삼각형을 그립니다");
    }
}
public class DrawableMain {
    public static void main(String[] args) {
        Drawable[] shapes = {
                new Circle(5),
                new Rectangle(4, 6),
                new Triangle(3, 4)
        };

        for (Drawable shape : shapes) {
            shape.draw();
        }
    }
}
