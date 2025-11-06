package b.oop;

public class Circle {
    public int radius;

    public Circle (int redius) {
        this.radius = redius;
    }

    public double area() {
        return this.radius * this.radius * 3.14;
    }
}
