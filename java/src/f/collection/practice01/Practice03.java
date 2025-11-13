package f.collection.practice01;

import java.util.ArrayList;
import java.util.Arrays;

public class Practice03 {
    public static int maxSubArraySum(ArrayList<Integer> list, int k) {
        if (list == null || list.size() < k) {
            return -1;
        }
//        [1, 6, 3, 2, 8, 5, 3]  / k = 3

        int windowSum = 0;
        for (int i = 0; i < k; i++) {
            windowSum += list.get(i);
        }
        int maxSum = windowSum;
        for (int i = k; i < list.size(); i++) {
            windowSum = windowSum + list.get(i) - list.get(i - k);

            if (windowSum > maxSum) {
                maxSum = windowSum;
            }
        }
        return maxSum;
    }
    public static void main(String[] args) {
        // 테스트 1
        ArrayList<Integer> list1 = new ArrayList<>(
                Arrays.asList(1, 4, 2, 10, 23, 3, 1, 0, 20)
        );
        System.out.println("입력: " + list1 + ", k=4");
        System.out.println("최대 합: " + maxSubArraySum(list1, 4));

        // 테스트 2
        ArrayList<Integer> list2 = new ArrayList<>(
                Arrays.asList(2, 1, 5, 1, 3, 2)
        );
        System.out.println("\n입력: " + list2 + ", k=3");
        System.out.println("최대 합: " + maxSubArraySum(list2, 3));

        // 테스트 3
        ArrayList<Integer> list3 = new ArrayList<>(
                Arrays.asList(1, 2, 3, 4, 5)
        );
        System.out.println("\n입력: " + list3 + ", k=2");
        System.out.println("최대 합: " + maxSubArraySum(list3, 2));

        // 테스트 4
        ArrayList<Integer> list4 = new ArrayList<>(
                Arrays.asList(5, 5, 5, 5)
        );
        System.out.println("\n입력: " + list4 + ", k=3");
        System.out.println("최대 합: " + maxSubArraySum(list4, 3));
    }
//    문제 3: 특정 길이 부분 배열의 최대 합
//    정수 리스트에서 길이가 k인 연속된 부분 배열의 합 중 최댓값을 찾으세요.
//
//            입력:
//
//    정수가 담긴 ArrayList
//    부분 배열의 길이 k
//    출력:
//
//    길이 k인 부분 배열의 최대 합
//    예제:
//
//    입력: [1, 4, 2, 10, 23, 3, 1, 0, 20], k=4
//    부분 배열들:
//            [1, 4, 2, 10] = 17
//            [4, 2, 10, 23] = 39
//            [2, 10, 23, 3] = 38
//            [10, 23, 3, 1] = 37
//            [23, 3, 1, 0] = 27
//            [3, 1, 0, 20] = 24
//    출력: 39
//
//    입력: [2, 1, 5, 1, 3, 2], k=3
//    부분 배열들:
//            [2, 1, 5] = 8
//            [1, 5, 1] = 7
//            [5, 1, 3] = 9
//            [1, 3, 2] = 6
//    출력: 9
//
//    입력: [1, 2, 3, 4, 5], k=2
//    부분 배열들:
//            [1, 2] = 3
//            [2, 3] = 5
//            [3, 4] = 7
//            [4, 5] = 9
//    출력: 9
//
//    입력: [5, 5, 5, 5], k=3
//    부분 배열들:
//            [5, 5, 5] = 15
//            [5, 5, 5] = 15
//    출력: 15
//    테스트 코드:
//
//            import java.util.*;
//
//    public class Practice03 {
//        public static void main(String[] args) {
//            // 테스트 1
//            ArrayList<Integer> list1 = new ArrayList<>(
//                    Arrays.asList(1, 4, 2, 10, 23, 3, 1, 0, 20)
//            );
//            System.out.println("입력: " + list1 + ", k=4");
//            System.out.println("최대 합: " + maxSubArraySum(list1, 4));
//
//            // 테스트 2
//            ArrayList<Integer> list2 = new ArrayList<>(
//                    Arrays.asList(2, 1, 5, 1, 3, 2)
//            );
//            System.out.println("\n입력: " + list2 + ", k=3");
//            System.out.println("최대 합: " + maxSubArraySum(list2, 3));
//
//            // 테스트 3
//            ArrayList<Integer> list3 = new ArrayList<>(
//                    Arrays.asList(1, 2, 3, 4, 5)
//            );
//            System.out.println("\n입력: " + list3 + ", k=2");
//            System.out.println("최대 합: " + maxSubArraySum(list3, 2));
//
//            // 테스트 4
//            ArrayList<Integer> list4 = new ArrayList<>(
//                    Arrays.asList(5, 5, 5, 5)
//            );
//            System.out.println("\n입력: " + list4 + ", k=3");
//            System.out.println("최대 합: " + maxSubArraySum(list4, 3));
//        }
//
//        public static int maxSubArraySum(ArrayList<Integer> list, int k) {
//            // 여기에 코드 작성 (Sliding Window)
//            return 0;
//        }
//    }

}
