package d.Inheritance;

class Animal3{
    void makeSound() {
        System.out.println("소리냄");
    }
}

class Dog3 extends Animal3{
    @Override
    void makeSound() {
        System.out.println("멍멍!");
    }
    void bark() {
        System.out.println("왈왈!");
    }
}
class Cat3 extends Animal3{
    @Override
    void makeSound() {
        System.out.println("야옹!");
    }
    void meow() {
        System.out.println("야옹야~옹");
    }
}

class Bird3 extends Animal3{
    @Override
    void makeSound() {
        System.out.println("짹짹!");
    }
}

class Rabbit3 extends Animal3{
    @Override
    void makeSound() {
        System.out.println("깡총!");
    }
}

public class PolyMain {
    public static void main(String[] args) {
//        Dog3 d = new Dog3();
//        Cat3 c = new Cat3();
//        d.makeSound();
//        c.makeSound();
//        Bird3  b = new Bird3();
//        b.makeSound();

//        Animal3 a1 = new Dog3();
//        Animal3 a2 = new Cat3();
//        Animal3 a3 = new Bird3();
//
//        a3.makeSound();
//
//        soundAnimal(a1);
//        soundAnimal(a2);
//        soundAnimal(a3);
//        Animal3 a4 = new Rabbit3();
//        soundAnimal(a4);

        Animal3[] animals={new Bird3(), new Cat3(), new Dog3(),  new Rabbit3()};
        for (Animal3 animal : animals) {
            animal.makeSound();
        }
//d
//        for (int  i = 0; i<animals.length;i++) {
//            animals[i].makeSound();
//        }

        Dog3 d1 = new Dog3();
        d1.makeSound();
        d1.bark();

        Animal3 d2 = new Dog3();
        d2.makeSound();
        // d2.bark();       // 컴파일 에러! Animal에는 bark() 없음

        Animal3 c1 = new Cat3();
        Cat3 c2 = (Cat3) c1;
        c2.meow();

        System.out.println(c2 instanceof Animal3);
        System.out.println(c2 instanceof Cat3);
        //System.out.println(c2 instanceof Dog3);
    }

    static void soundAnimal(Animal3 animal){
        animal.makeSound();
    }
}
