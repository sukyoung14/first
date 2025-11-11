package d.Inheritance;

class Parent{
    void show() {
        System.out.println("Parent");
    }
    final void display(){

    }
}
class Child extends Parent{
    @Override
    void show() {
        System.out.println("Child");
    }
// final 때문에 오류남
//    @Override
//    void display(){  }

}
public class OverringMain {
    public static void main(String[] args) {
        Child c = new Child();
        c.show();
    }
}
