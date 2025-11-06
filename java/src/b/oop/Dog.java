package b.oop;

public class Dog {
    String name;
    int age;
    String breed;

    public Dog(String name, int age, String breed) {
        this.name = name;
        this.age = age;
        this.breed = breed;
    }
    
    void brak() {
        System.out.println("왈왈");
    }
}
