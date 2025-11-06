package b.oop.practice;

public class Dog {
    public String name;
    public String Breed;

    public Dog (String name, String Breed){
        this.name = name;
        this.Breed = Breed;
    }

    void sit (){
        System.out.printf("%s %s가 앉았습니다.", this.Breed, this.name);
        System.out.println();
    }
    void hand (){
        System.out.printf("%s %s가 손을 내밀었습니다.", this.Breed, this.name);
        System.out.println();
    }
}
