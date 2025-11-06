package b.oop.practice;

public class Person {
    String name;
    int age;
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    void printInfo() {
        System.out.printf("이름: %s, 나이: %d세", this.name, this.age);
        System.out.println();
    }
}
