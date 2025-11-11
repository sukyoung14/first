package d.Inheritance.practice;

class Animal {
    String name;
    int age;

    public Animal(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public void makeSound() {
        System.out.println("=== 먹이 시간 ===");
    }
}

class Lion extends Animal {
    public Lion(String name, int age) {
        super(name, age);
    }
    @Override
    public void makeSound() {
        System.out.println("사자 "+ name + ": 어흥!");
    }
}
class Elephant extends Animal {
    public Elephant(String name, int age) {
        super(name, age);
    }
    @Override
    public void makeSound() {
        System.out.println("코끼리 "+ name + ": 뿌우우!");
    }
}
class Monkey  extends Animal {
    public Monkey(String name, int age) {
        super(name, age);
    }
    @Override
    public void makeSound() {
        System.out.println("원숭이 " + name + ": 끼끼!");
    }
}
class Zoo {
   /* public void feedingTime() {
        Animal[] animals={new Lion("심바",1), new Elephant("덤보",2), new Monkey("조조",3)};

        for (Animal animal : animals) animal.makeSound();
    }*/

    Animal[] animals;
    int count = 0;

    public Zoo(int capacity){
        this.animals = new Animal[capacity];
        this.count = 0;
    }
    void addAnimal(Animal animal){
        if (count < animals.length){
            animals[count++] = animal;
        }
    }
    public void feedingTime() {
        for (int i = 0; i < count; i++){
            animals[i].makeSound();
        }
    }
}
public class AnimalMain {
    public static void main(String[] args) {
//        Zoo z = new Zoo();
//        z.feedingTime();

        Zoo z = new Zoo(100);
        z.addAnimal(new Lion("심바", 5));
        z.addAnimal(new Elephant("덤보", 6));
        z.addAnimal(new Monkey("조조", 7));
        z.feedingTime();
    }
}
