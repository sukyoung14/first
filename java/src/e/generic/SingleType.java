package e.generic;
class Container<T> {
    private T value;

    public Container(T value) {
        this.value = value;
    }

    public T getValue() {
        return value;
    }

    public void setValue(T value) {
        this.value = value;
    }
}
public class SingleType {
    public static void main(String[] args) {
        Container<String> c1 = new Container<String>("hello");
        System.out.println(c1.getValue());
        Container<Integer> c2 = new Container<Integer>(1);
        System.out.println(c2.getValue());
    }
}
