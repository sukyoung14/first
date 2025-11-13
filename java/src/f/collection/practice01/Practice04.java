package f.collection.practice01;

import java.util.ArrayList;
import java.util.Arrays;

public class Practice04 {
    public static ArrayList<ArrayList<Integer>> countFrequency(ArrayList<Integer> list) {
        if (list == null || list.isEmpty()) {
            return new ArrayList<>();
        }

        ArrayList<ArrayList<Integer>> result = new ArrayList<>();

        // [1, 3, 2, 1, 3, 1]
        for (int num : list) {
            boolean found = false;

            // 이미 결과에 있는지 확인 => +1
            for (ArrayList<Integer> pair : result) {
                if(pair.get(0) == num) {
                    pair.set(1, pair.get(1) + 1);
                    found = true;
                    break;
                }
            }
            // 최초 발견 => 리스트에 추가 [n, 1]
            if (!found) {
                ArrayList<Integer> newPair = new ArrayList<>();
                newPair.add(num);
                newPair.add(1);
                result.add(newPair);
            }
        }

        return result;
    }
    public static void main(String[] args) {
        // 테스트 1
        ArrayList<Integer> list1 = new ArrayList<>(
                Arrays.asList(1, 3, 2, 1, 3, 1)
        );
        System.out.println("입력: " + list1);
        System.out.println("출력: " + countFrequency(list1));

        // 테스트 2
        ArrayList<Integer> list2 = new ArrayList<>(
                Arrays.asList(5, 5, 5, 5, 5)
        );
        System.out.println("\n입력: " + list2);
        System.out.println("출력: " + countFrequency(list2));

        // 테스트 3
        ArrayList<Integer> list3 = new ArrayList<>(
                Arrays.asList(1, 2, 3, 4, 5)
        );
        System.out.println("\n입력: " + list3);
        System.out.println("출력: " + countFrequency(list3));

        // 테스트 4
        ArrayList<Integer> list4 = new ArrayList<>();
        System.out.println("\n입력: " + list4);
        System.out.println("출력: " + countFrequency(list4));
//        문제 4: 숫자별 빈도수 세기
//        리스트에 있는 각 숫자가 몇 번 나타나는지 세어 [값, 개수] 형태로 반환하세요.
//
//        입력:
//
//        정수가 담긴 ArrayList
//        출력:
//
//        ArrayList<ArrayList>
//        각 내부 리스트: [값, 개수]
//        결과는 처음 나타난 순서대로 저장
//        예제:
//
//        입력: [1, 3, 2, 1, 3, 1]
//        출력: [[1, 3], [3, 2], [2, 1]]
//
//        입력: [5, 5, 5, 5, 5]
//        출력: [[5, 5]]
//
//        입력: [1, 2, 3, 4, 5]
//        출력: [[1, 1], [2, 1], [3, 1], [4, 1], [5, 1]]
//
//        입력: []
//        출력: []
//        테스트 코드:
//
//import java.util.*;
//
//        public class Practice04 {
//            public static void main(String[] args) {
//                // 테스트 1
//                ArrayList<Integer> list1 = new ArrayList<>(
//                        Arrays.asList(1, 3, 2, 1, 3, 1)
//                );
//                System.out.println("입력: " + list1);
//                System.out.println("출력: " + countFrequency(list1));
//
//                // 테스트 2
//                ArrayList<Integer> list2 = new ArrayList<>(
//                        Arrays.asList(5, 5, 5, 5, 5)
//                );
//                System.out.println("\n입력: " + list2);
//                System.out.println("출력: " + countFrequency(list2));
//
//                // 테스트 3
//                ArrayList<Integer> list3 = new ArrayList<>(
//                        Arrays.asList(1, 2, 3, 4, 5)
//                );
//                System.out.println("\n입력: " + list3);
//                System.out.println("출력: " + countFrequency(list3));
//
//                // 테스트 4
//                ArrayList<Integer> list4 = new ArrayList<>();
//                System.out.println("\n입력: " + list4);
//                System.out.println("출력: " + countFrequency(list4));
//            }
//
//            public static ArrayList<ArrayList<Integer>> countFrequency(ArrayList<Integer> list) {
//                // 여기에 코드 작성
//                return new ArrayList<>();
//            }
//        }
    }

}
