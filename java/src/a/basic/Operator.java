package a.basic;

public class Operator {
    public static void main(String[] args){
        int a = 10;
        int b = 20;
        System.out.println( a + b );
        System.out.println( a % b );
        int x = 10;
        int y = 3;
        System.out.println( x / y );
        double result = (double) x / y;
        System.out.println( result );
        System.out.println("x = " + x++ );
        System.out.println("x = " + x );
        x += 5;   // num = num + 5
        System.out.println("x += 5 ==> " + x);

        int highNum = 999;
        int smallNum = 1;
        System.out.println(highNum == smallNum);
        String strA = "hello";
        String strB = "hello";
        String strC = new String("hello");
        System.out.println("strA ==  strB ==> " + (strA == strB));
        System.out.println("strA ==  strC ==> " + (strA == strC));
        System.out.println("strA ==  strC ==> " + (strA.equals(strC) ));

        boolean boolA = true;
        boolean boolB = false;
        System.out.println(boolA != boolB);

        // 단락평가
        int myX = 0;
        if (myX != 0 && 10 / x > 1){
            System.out.println("실행되나요?");
        }
        int age = 20;
        String adult = ( age > 18) ? "성인" : "청소년";
        System.out.println(adult);

        int intA = 10;
        int intB = 11;
        System.out.println(intA & intB);
        System.out.println(intA | intB);
        int intC = 123456;
        System.out.println(intC << 1);  //(2배)
        System.out.println(intC >> 1);  //(1/2)
    }
}
