package f.collection.practice02;

import java.util.HashMap;
import java.util.Map;

public class Practice02 {
    public static Map<String, Integer> countWordFrequency(String[] words) {
        if (words == null || words.length == 0) {
            return null;
        }
        Map<String, Integer> map = new HashMap<String, Integer>();
        for (String word : words) {
            map.put(word, map.getOrDefault(word, 0) + 1);
        }
        return map;
    }
    public static void main(String[] args) {
        // 테스트 1
        String[] words1 = {"apple", "banana", "apple", "cherry", "banana", "apple"};
        Map<String, Integer> result1 = countWordFrequency(words1);
        System.out.println("테스트 1: " + result1);
        // {apple=3, banana=2, cherry=1}

        // 테스트 2
        String[] words2 = {"hello", "world"};
        Map<String, Integer> result2 = countWordFrequency(words2);
        System.out.println("테스트 2: " + result2);
        // {hello=1, world=1}

        // 테스트 3: 빈 배열
        String[] words3 = {};
        Map<String, Integer> result3 = countWordFrequency(words3);
        System.out.println("테스트 3: " + result3);
        // {}

        // 테스트 4: 모두 같은 단어
        String[] words4 = {"test", "test", "test"};
        Map<String, Integer> result4 = countWordFrequency(words4);
        System.out.println("테스트 4: " + result4);
        // {test=3}

//        문제 2: 단어 빈도수 세기
//        문자열 배열이 주어질 때, 각 단어가 몇 번 등장하는지 세어서 Map으로 반환하세요.
//
//                요구사항:
//
//        메서드명: countWordFrequency
//        파라미터: String[] words
//        반환 타입: Map<String, Integer>
//        키: 단어, 값: 등장 횟수
//        대소문자 구분
//        제약 조건:
//
//        배열 크기: 0 이상
//        빈 배열이면 빈 Map 반환
//        null 값은 없다고 가정
//        예시:
//
//        입력	출력
//["apple", "banana", "apple", "cherry", "banana", "apple"]	{apple=3, banana=2, cherry=1}
//["hello", "world"]	{hello=1, world=1}
//[]	{}
//["test", "test", "test"]	{test=3}
//        힌트:
//
//        HashMap 사용
//        getOrDefault() 또는 putIfAbsent() 활용
//        테스트 코드:
//
//        public class Practice03 {
//            public static void main(String[] args) {
//                // 테스트 1
//                String[] words1 = {"apple", "banana", "apple", "cherry", "banana", "apple"};
//                Map<String, Integer> result1 = countWordFrequency(words1);
//                System.out.println("테스트 1: " + result1);
//                // {apple=3, banana=2, cherry=1}
//
//                // 테스트 2
//                String[] words2 = {"hello", "world"};
//                Map<String, Integer> result2 = countWordFrequency(words2);
//                System.out.println("테스트 2: " + result2);
//                // {hello=1, world=1}
//
//                // 테스트 3: 빈 배열
//                String[] words3 = {};
//                Map<String, Integer> result3 = countWordFrequency(words3);
//                System.out.println("테스트 3: " + result3);
//                // {}
//
//                // 테스트 4: 모두 같은 단어
//                String[] words4 = {"test", "test", "test"};
//                Map<String, Integer> result4 = countWordFrequency(words4);
//                System.out.println("테스트 4: " + result4);
//                // {test=3}
//            }
//
//            // 여기에 메서드 구현
//            public static Map<String, Integer> countWordFrequency(String[] words) {
//                // 구현 필요
//                return null;
//            }
//        }
    }

}
