package c.oop2;

public class Retangle {
    int width;
    int height;
    public Retangle(){
        this(1, 1);
    }

    public Retangle(int size){
        this(size, size);
    }

    public Retangle(int width, int height){
        this.width = width;
        this.height = height;
    }

    public int getArea() {
        return width * height;
    }
}
