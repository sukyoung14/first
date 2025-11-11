package d.Inheritance.practice;

class Person {
    String name;
    int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    void introduce() {
        System.out.println("hello");
    }
}
class Student extends Person{
    public Student(String name, int age, String studentId, String major) {
        super(name, age);
        this.studentId = studentId;
        this.major = major;
    }

    String studentId;
    String major;
    @Override
    void introduce(){
        System.out.println("안녕하세요, 저는 " + this.name + "입니다. " + this.age + "살이고, 학번은 " + this.studentId + "이며, " + this.major  + "을 전공합니다.");
    }
}
public class PersonMain {
    public static void main(String[] args) {
        Student s = new Student("김철수", 20, "2024001","컴퓨터공학" );
        s.introduce();
    }
}
