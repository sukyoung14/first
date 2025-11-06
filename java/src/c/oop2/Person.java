package c.oop2;

public class Person {
    String name;
    int age;
    String address;

    public Person() {
        this.name = "noname";
        this.age = 0;
    }

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public Person(String name, int age, String address) {
        this(name, age);
        this.address = address;
    }
}

