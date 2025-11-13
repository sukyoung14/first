package f.collection.practice01;

import java.util.ArrayList;
import java.util.Arrays;

public class Practice02 {
    public static void rotateLeft(ArrayList<Integer> list, int k) {
        if (list == null || list.isEmpty()){
            return;
        }
        int size = list.size();
        k = k % size;
        ArrayList<Integer> Afterlist = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            int first = list.remove(0);
            list.add(first);
        }
    }
    public static int findAfterRotation(ArrayList<Integer> list, int k, int target) {
        if (list == null || list.isEmpty()){
            return -1;
        }
        rotateLeft(list, k);
        return list.indexOf(target);
    }

    public static void main(String[] args) {
        // 테스트 1
        ArrayList<Integer> list1 = new ArrayList<>(Arrays.asList(1, 2, 3, 4, 5));
        System.out.println("원본: " + list1);
        int result1 = findAfterRotation(list1, 2, 1);
        System.out.println("2번 회전 후: " + list1);
        System.out.println("1의 인덱스: " + result1);

        // 테스트 2
        ArrayList<Integer> list2 = new ArrayList<>(Arrays.asList(10, 20, 30, 40));
        System.out.println("\n원본: " + list2);
        int result2 = findAfterRotation(list2, 1, 40);
        System.out.println("1번 회전 후: " + list2);
        System.out.println("40의 인덱스: " + result2);

        // 테스트 3
        ArrayList<Integer> list3 = new ArrayList<>(Arrays.asList(1, 2, 3));
        System.out.println("\n원본: " + list3);
        int result3 = findAfterRotation(list3, 5, 2);
        System.out.println("5번 회전 후 (5%3=2): " + list3);
        System.out.println("2의 인덱스: " + result3);

//        문제 2: 배열 회전 후 특정 값 찾기
//        리스트를 왼쪽으로 k번 회전한 후, 특정 값의 인덱스를 찾는 프로그램을 작성하세요.
//
//                입력:
//
//        정수가 담긴 ArrayList
//        회전 횟수 k
//        찾을 값 target
//        출력:
//
//        회전 후 target의 인덱스 (없으면 -1)
//        예제:
//
//        입력: [1, 2, 3, 4, 5], k=2, target=1
//        회전 과정:
//        원본: [1, 2, 3, 4, 5]
//        1회전: [2, 3, 4, 5, 1]
//        2회전: [3, 4, 5, 1, 2]
//        출력: 3 (1의 인덱스)
//
//        입력: [10, 20, 30, 40], k=1, target=40
//        회전 과정:
//        원본: [10, 20, 30, 40]
//        1회전: [20, 30, 40, 10]
//        출력: 2 (40의 인덱스)
//
//        입력: [1, 2, 3], k=5, target=2
//        회전 과정:
//        5 % 3 = 2번 회전
//        원본: [1, 2, 3]
//        1회전: [2, 3, 1]
//        2회전: [3, 1, 2]
//        출력: 2 (2의 인덱스)
//        테스트 코드:
//
//import java.util.*;
//
//        public class Practice02 {
//            public static void main(String[] args) {
//                // 테스트 1
//                ArrayList<Integer> list1 = new ArrayList<>(Arrays.asList(1, 2, 3, 4, 5));
//                System.out.println("원본: " + list1);
//                int result1 = findAfterRotation(list1, 2, 1);
//                System.out.println("2번 회전 후: " + list1);
//                System.out.println("1의 인덱스: " + result1);
//
//                // 테스트 2
//                ArrayList<Integer> list2 = new ArrayList<>(Arrays.asList(10, 20, 30, 40));
//                System.out.println("\n원본: " + list2);
//                int result2 = findAfterRotation(list2, 1, 40);
//                System.out.println("1번 회전 후: " + list2);
//                System.out.println("40의 인덱스: " + result2);
//
//                // 테스트 3
//                ArrayList<Integer> list3 = new ArrayList<>(Arrays.asList(1, 2, 3));
//                System.out.println("\n원본: " + list3);
//                int result3 = findAfterRotation(list3, 5, 2);
//                System.out.println("5번 회전 후 (5%3=2): " + list3);
//                System.out.println("2의 인덱스: " + result3);
//            }
//
//            public static int findAfterRotation(ArrayList<Integer> list, int k, int target) {
//                // 여기에 코드 작성
//                return -1;
//            }
//        }
//        힌트:
//
//        k가 리스트 크기보다 클 수 있으므로 k % size 활용
//        왼쪽 회전: 첫 번째 요소를 마지막으로 이동
    }
}
