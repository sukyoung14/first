package b.oop;

public class Person {
    // 데이터, 필드, 속성
    String name;
    int age;

    // 생성자
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // 메서드
    void introduce() {
        System.out.println("안녕하세요, 저는 " + name + "이고 " + age + "살입니다.");
    }
}
