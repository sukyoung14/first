package a.basic;

public class Variable {
    public static void main(String[] args){
        System.out.print("variable");

        // 선언
        // 타입 변수명;
        int age;
        // 할당
        // 변수명 = 값;
        age = 20;
        System.out.printf("나이 %d", age);

        // 선언과 할당을 같이
        // 타입 변수명 = 값;
        String name = "Kim";
        System.out.printf("이름 %s", name);

        // 기본형 타입
        // 정수형(byte, short, int, long)
        byte b = 100;
        short s = 10000;
        int i = 100000000;
        long l = 1000000000;

        System.out.println();
        System.out.println(b);
        int million = 1_000_000;     // 언더스코어로 가독성 향상 (Java 7+)
        System.out.println("백만: " + million);

        // 실수형(float, double)
        float f = 3.14F;
        double d = 3.14;
        System.out.println(f);

        // 문자열(char)
        char c = 'a';
        System.out.println(c);

        // 특수 문자
        char newLine = '\n';     // 줄바꿈
        char tab = '\t';         // 탭
        char backslash = '\\';   // 백슬래시
        char quote = '\'';       // 작은따옴표

        System.out.println("Hello" + quote + "World");
        // 논리형 (boolean )
        boolean isTrue = true;
        System.out.println(isTrue);

        // 참조형 타입
        // String(문자열 타입)
        String str = "Hello";
        System.out.println(str);

        String str2 = " World";
        String msg = str + str2;
        System.out.println(msg);

        // null
        String str3 = null;
        
        // 형변환
        //int iA = 100;
        //double aA = iA;
        double dB = 3.14;
        // 자동변환 불가
        // int in = dB;
        // 강제 형변환
        int iB = (int) dB;
        System.out.println(iB);
        // var
        var myData = true;
        var myData1 = 12;
        var myData2 = "hello";
        myData = false;
        System.out.println(myData);
    }
}
