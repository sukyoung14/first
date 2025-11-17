package g.javaclass;

import java.util.Arrays;

public class StringMain {
    public static void main(String[] args) {
        String str1 = "Hello";
        String str2 = "Hello";

        System.out.println(str1 == str2);

//        String str3 = new String( "h1");
//        String str4 = new String( "h1");
//        System.out.println(str3 == str4);

        String str3 = "hello";
        System.out.println(str1.equals(str2));      // 값을 비교
        System.out.println(str1.equalsIgnoreCase(str3));      // 대소문자 무시 비교

        System.out.println(str1.length());  // 5        // 길이
        System.out.println(str1.charAt(2));  // l        // 특정 위치의 문자
        System.out.println(str1.indexOf("e"));  // 2        // (첫 번째 발견)
        System.out.println(str1.lastIndexOf("l"));  // 3        // (마지막 발견)

        System.out.println(str1.substring(2, 4));   // "ll"

        System.out.println(str1.contains("e"));      // true        // 포함 여부

        String csv = "apple, banana, orage";
        String[] strArr = csv.split(",");
        System.out.println(Arrays.toString(strArr));
        for (String str : strArr) {
            System.out.println(str.trim());
        }
        StringBuilder sb = new StringBuilder();
        sb.append(1);
        sb.append(5);
        sb.append(10);
        System.out.println(sb.toString());
    }
}
