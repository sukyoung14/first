package e.generic;
class NumberBox<T extends Number> {
    private T value;

    public NumberBox(T value) {
        this.value = value;
    }

    public T getValue() {
        return value;
    }
    public double getDoubleValue() {
        return value.doubleValue();
        //return (double) value;
    }
}

class SortedBox<T extends Comparable> {
    private T value;

    public SortedBox(T value) {
        this.value = value;
    }

    public boolean isGreaterThan(T other) {
        return value.compareTo(other) > 0;
    }
}
public class ExtendsGeneric {
    public static void main(String[] args) {
        NumberBox<Integer> nb1 = new NumberBox<>(10);
        int i = nb1.getValue();

        NumberBox<Double> n2 = new NumberBox<>(3.044);
        double d = n2.getValue();
        nb1.getDoubleValue();

        SortedBox<Integer> b1 = new SortedBox<>(10);
                System.out.print(b1.isGreaterThan(5));
    }
}
