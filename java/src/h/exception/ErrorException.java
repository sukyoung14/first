package h.exception;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class ErrorException {
    public static void main(String[] args) {
        // Error
        // recursiveMethod();

        // Exception
//        try {
//            int result = 10 / 0;
//        }
//        catch (ArithmeticException e) {
//            System.out.println("0으로 나눌 수 없습니다.");
//        }

        // NullPointerException
//        String str = null;
//        System.out.println(str.length());

        // ArrayIndexOutOfBoundsException
//        int[] arr = {1, 2, 3};
//        System.out.println(arr[5]);  // 인덱스 초과

        // NumberFormatException
        //int num = Integer.parseInt("abc");  // 숫자로 변환 불가

//        int age = -10;
//        if (age < 0) {
//            throw new IllegalArgumentException();
//        }

        // IllegalArgumentException
//        public void setAge(int age) {
//            if (age < 0) {
//                throw new IllegalArgumentException("나이는 0 이상이어야 합니다.");
//            }
//            this.age = age;
//        }

        //throw new IllegalArgumentException();

//        try {
//            FileReader fr = new FileReader("a.txt");
//        } catch (FileNotFoundException e) {
//            throw new RuntimeException(e);
//        }
        try {
            int result = 1 / 0;
        }
        catch (ArithmeticException e) {
            System.out.println("0으로 나눌수 없습니다.");
        }

        FileReader fr = null;
        try {
            fr = new FileReader("data.txt");
            System.out.println("파일을 불러왔습니다.");
        } catch (IOException e) {
            System.out.println("파일이 존재하지 않습니다.");
        } finally {
            if (fr != null) {
                try {
                    fr.close();
                } catch (IOException e) {
                    System.out.println("close 실패");
                }
            }
        }

    }
//    static void recursiveMethod(){
//        recursiveMethod();
//    }
}
