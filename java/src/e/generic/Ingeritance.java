package e.generic;

class Parent <T> {
    private T value;

    public Parent(T value) {
        this.value = value;
    }

    public T getValue() {
        return value;
    }
}
class Child<T> extends Parent<T> {
    public Child(T value) {
        super(value);
    }
}
class StringChild extends Parent<String> {
    public StringChild(String value) {
        super(value);
    }
}
class ExtendsChild <T, U> extends Parent<String> {
    private U value2;
    public ExtendsChild(String value, U value2) {
        super(value);
        this.value2 = value2;
    }
}

public class Ingeritance {
    public static void main(String[] args) {
        Parent<String> p1 = new Parent<String>("hello");
        Child<String> c1 = new Child<String>("hi");
        StringChild sc1 = new StringChild("hihi");
        ExtendsChild<String, Integer> c2 = new ExtendsChild<String, Integer>("hihi", 10);
    }
}
