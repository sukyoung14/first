package f.collection.practice02;

import java.util.*;

public class Practice03 {
    public static Map<Character, List<Integer>> findCharacterPositions(String str) {
        if (str == null || str.isEmpty()) {
            return null;
        }
        HashMap<Character, List<Integer>> map = new HashMap<Character, List<Integer>>();
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);

            //containsKey 활용
//            if (!map.containsKey(c)) {
//                map.put(c, new ArrayList<>());
//            }
            map.putIfAbsent(c, new ArrayList<>());
            map.get(c).add(i);
        }

        return map;
    }
    public static void main(String[] args) {
        // 테스트 1
        String str1 = "hello";
        Map<Character, List<Integer>> result1 = findCharacterPositions(str1);
        System.out.println("테스트 1: " + result1);
        // {h=[0], e=[1], l=[2, 3], o=[4]}

        // 테스트 2
        String str2 = "programming";
        Map<Character, List<Integer>> result2 = findCharacterPositions(str2);
        System.out.println("테스트 2: " + result2);

        // 테스트 3: 모두 같은 문자
        String str3 = "aaa";
        Map<Character, List<Integer>> result3 = findCharacterPositions(str3);
        System.out.println("테스트 3: " + result3);
        // {a=[0, 1, 2]}

        // 테스트 4: 빈 문자열
        String str4 = "";
        Map<Character, List<Integer>> result4 = findCharacterPositions(str4);
        System.out.println("테스트 4: " + result4);
        // {}

//        문제 3: 문자 위치 인덱스 찾기
//        문자열이 주어질 때, 각 문자가 등장하는 모든 위치(인덱스)를 Map으로 반환하세요.
//
//        요구사항:
//
//        메서드명: findCharacterPositions
//        파라미터: String str
//        반환 타입: Map<Character, List<Integer>>
//        키: 문자, 값: 등장 위치 리스트
//        대소문자 구분
//        제약 조건:
//
//        문자열 길이: 0 이상
//        빈 문자열이면 빈 Map 반환
//        인덱스는 0부터 시작
//        예시:
//
//        입력	출력
//        "hello"	{h=[0], e=[1], l=[2, 3], o=[4]}
//        "programming"	{p=[0], r=[1, 4], o=[2], g=[3, 6, 7], a=[5], m=[8, 9], i=[10], n=[11]}
//        "aaa"	{a=[0, 1, 2]}
//        ""	{}
//        힌트:
//
//        HashMap과 ArrayList 조합
//        putIfAbsent()로 리스트 초기화
//        테스트 코드:
//
//import java.util.*;
//
//        public class Practice05 {
//            public static void main(String[] args) {
//                // 테스트 1
//                String str1 = "hello";
//                Map<Character, List<Integer>> result1 = findCharacterPositions(str1);
//                System.out.println("테스트 1: " + result1);
//                // {h=[0], e=[1], l=[2, 3], o=[4]}
//
//                // 테스트 2
//                String str2 = "programming";
//                Map<Character, List<Integer>> result2 = findCharacterPositions(str2);
//                System.out.println("테스트 2: " + result2);
//
//                // 테스트 3: 모두 같은 문자
//                String str3 = "aaa";
//                Map<Character, List<Integer>> result3 = findCharacterPositions(str3);
//                System.out.println("테스트 3: " + result3);
//                // {a=[0, 1, 2]}
//
//                // 테스트 4: 빈 문자열
//                String str4 = "";
//                Map<Character, List<Integer>> result4 = findCharacterPositions(str4);
//                System.out.println("테스트 4: " + result4);
//                // {}
//            }
//
//            // 여기에 메서드 구현
//            public static Map<Character, List<Integer>> findCharacterPositions(String str) {
//                // 구현 필요
//                return null;
//            }
//        }
    }
}
