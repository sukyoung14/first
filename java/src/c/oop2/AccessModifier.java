package c.oop2;

public class AccessModifier {
    public static void main(String[] args) {
        PrivateClass pc = new PrivateClass(10);
        pc.resetValue();
        System.out.println(pc.getValue());

        pc.value2 = "Test msg";
    }
}
