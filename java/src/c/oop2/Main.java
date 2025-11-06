package c.oop2;

public class Main {
    public static void main(String[] args) {
        Calculator cal = new Calculator();
        int result = cal.add(1,2);
        int result2 = cal.add(1,2,3);
        int result3 = cal.add(1,2,3,4,5);

        cal.printResult(result);
        cal.printResult(result3);

        Person person = new Person();
        Person person2 = new Person("kim", 20);
        Person person3 = new Person("kim", 20, "서울");

        Retangle r1 = new Retangle();
        Retangle r2 = new Retangle(10);
        Retangle r3 = new Retangle(20,30);

        User u = new User("홍길동", 20);
        u.setName("김길동");
        System.out.println(u.getName());

    }
}
