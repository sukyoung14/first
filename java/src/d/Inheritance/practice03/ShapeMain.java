package d.Inheritance.practice03;

abstract class Shape{
    protected int x, y;
    protected String color;

    public Shape(int x, int y, String color) {
        this.x = x;
        this.y = y;
        this.color = color;
    }

    public final void draw(){
        moveTo();
        setColor();
        drawShape();
    }
    void moveTo(){
        System.out.println("위치 이동: (" + x + ", " + y + ")");
    }
    void setColor(){
        System.out.println("색상 설정: ["+ color +"]");
    }
    abstract void drawShape();
}

class Circle extends Shape{
    private int radius;

    public Circle(int x, int y, String color, int radius) {
        super(x, y, color);
        this.radius = radius;
    }

    @Override
    void drawShape() {
        System.out.println("반지름 [" + radius + "]인 원 그리기");
    }
}

class Rectangle extends Shape{
    private int width, height;
    public Rectangle(int x, int y, String color, int width, int height) {
        super(x, y, color);
        this.width = width;
        this.height = height;
    }
    @Override
    void drawShape() {
        System.out.println("["+ width + "]x[" + height + "] 사각형 그리기");
    }
}

class Triangle extends Shape{
    private int side1, side2, side3;
    public Triangle(int x, int y, String color, int side1, int side2, int side3) {
        super(x, y, color);
        this.side1 = side1;
        this.side2 = side2;
        this.side3 = side3;
    }
    @Override
    void drawShape() {
        System.out.println("변 ["+ side1 + "], ["+ side2 + "], ["+ side3 + "]인 삼각형 그리기");
    }
}

public class ShapeMain {
    public static void main(String[] args) {
        Shape[] shapes = {
                new Circle(0, 0, "빨강", 5),
                new Rectangle(10, 10, "파랑", 4, 6),
                new Triangle(20, 20, "초록", 3, 4, 5)
        };

        for (Shape shape : shapes) {
            shape.draw();
            System.out.println();
        }
    }
}
