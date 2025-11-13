package f.collection.practice01;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Practice01 {
    public static int findSecondLargest(ArrayList<Integer> list){
        if (list == null || list.size() < 2) {
            return -1;
        }
        int firstMax = -1;
        int secondMax = -1;
        for (int num : list) {
            if (num > firstMax ) {
                secondMax = firstMax;
                firstMax = num;
            }
            else if (num  > firstMax && num != secondMax){
                secondMax = num;
            }
        }

        return secondMax;
    }

    public static void main(String[] args) {
        ArrayList<Integer> list1 = new ArrayList<>(Arrays.asList(5, 3, 9, 1, 7));
        System.out.println("입력: " + list1);
        System.out.println("출력: " + findSecondLargest(list1));

        // 테스트 2
        ArrayList<Integer> list2 = new ArrayList<>(Arrays.asList(10, 10, 10));
        System.out.println("\n입력: " + list2);
        System.out.println("출력: " + findSecondLargest(list2));

        // 테스트 3
        ArrayList<Integer> list3 = new ArrayList<>(Arrays.asList(5, 5, 3, 3, 1));
        System.out.println("\n입력: " + list3);
        System.out.println("출력: " + findSecondLargest(list3));

        // 테스트 4
        ArrayList<Integer> list4 = new ArrayList<>(Arrays.asList(5));
        System.out.println("\n입력: " + list4);
        System.out.println("출력: " + findSecondLargest(list4));

//        문제 1: 두 번째로 큰 수 찾기
//        정수 리스트에서 두 번째로 큰 수를 찾는 프로그램을 작성하세요.
//
//                입력:
//
//        정수가 담긴 ArrayList
//        출력:
//
//        두 번째로 큰 수 (존재하지 않으면 -1)
//        제약 조건:
//
//        리스트의 크기는 0 이상
//        중복된 값이 있을 수 있음
//        모든 숫자는 양수 (positive integers)
//        Collections.sort() 사용 금지
//        예제:
//
//        입력: [5, 3, 9, 1, 7]
//        출력: 7
//
//        입력: [10, 10, 10]
//        출력: -1 (모두 같은 값)
//
//        입력: [5, 5, 3, 3, 1]
//        출력: 3
//
//        입력: [5]
//        출력: -1 (요소가 하나)
//        테스트 코드:
//
//import java.util.*;
//
//        public class Practice01 {
//            public static void main(String[] args) {
//                // 테스트 1
//                ArrayList<Integer> list1 = new ArrayList<>(Arrays.asList(5, 3, 9, 1, 7));
//                System.out.println("입력: " + list1);
//                System.out.println("출력: " + findSecondLargest(list1));
//
//                // 테스트 2
//                ArrayList<Integer> list2 = new ArrayList<>(Arrays.asList(10, 10, 10));
//                System.out.println("\n입력: " + list2);
//                System.out.println("출력: " + findSecondLargest(list2));
//
//                // 테스트 3
//                ArrayList<Integer> list3 = new ArrayList<>(Arrays.asList(5, 5, 3, 3, 1));
//                System.out.println("\n입력: " + list3);
//                System.out.println("출력: " + findSecondLargest(list3));
//
//                // 테스트 4
//                ArrayList<Integer> list4 = new ArrayList<>(Arrays.asList(5));
//                System.out.println("\n입력: " + list4);
//                System.out.println("출력: " + findSecondLargest(list4));
//            }
//
//            public static int findSecondLargest(ArrayList<Integer> list) {
//                // 여기에 코드 작성
//                return -1;
//            }
//        }

    }

}
