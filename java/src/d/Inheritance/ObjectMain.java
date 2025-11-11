package d.Inheritance;

import java.util.Objects;

class Myobject {
    String name;
    int value;

    public Myobject(String name, int value) {
        this.name = name;
        this.value = value;
    }

//    @Override
//    public String toString() {
//        return ("name = " + name + ", value = " + value);
//    }


    @Override
    public String toString() {
        return "Myobject{" +
                "name='" + name + '\'' +
                ", value=" + value +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        Myobject myobject = (Myobject) o;
        return value == myobject.value && Objects.equals(name, myobject.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, value);
    }
}
public class ObjectMain {
    public static void main(String[] args) {
        Myobject obj = new Myobject("test", 100);
        System.out.println(obj.toString());
        System.out.println(obj);

        Myobject obj2 = new Myobject("test", 100);
        System.out.println(obj.equals(obj2));

    }
}
