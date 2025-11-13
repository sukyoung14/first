package f.collection;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class HashSetMain {
    public static void main(String[] args) {
        HashSet<String> set = new HashSet<>();
        // 요소 추가
        set.add("Apple");
        set.add("Banana");
        set.add("Cherry");
        System.out.println(set); // [Banana, Apple, Cherry] (순서 무작위)

        // 중복 추가 시도
        boolean added = set.add("Apple");
        System.out.println("Apple 추가 성공? " + added); // false
        System.out.println(set); // 변화 없음       중복 추가 불가능

        // 포함 여부 확인
        System.out.println("Banana 포함? " + set.contains("Banana")); // true

        // 요소 삭제
        set.remove("Banana");
        System.out.println(set);

        // 크기 확인
        System.out.println("크기: " + set.size());

        // 비어있는지 확인
        System.out.println("비어있음? " + set.isEmpty());

        // 모든 요소 삭제
        //set.clear();
        //System.out.println("clear 후: " + set);

        // 1. for-each 문
        System.out.println("=== for-each ===");
        for (String itme: set) {
            System.out.println( "set : " + itme);
        }

        Set<Integer> intset1 = new HashSet<>(Arrays.asList(1, 2, 3, 4, 5));
        Set<Integer> intset2 = new HashSet<>(Arrays.asList(4, 5, 6, 7, 8));

        intset1.addAll(intset2);        //합집합 (Union)
        System.out.println("합집합 (Union) : " + intset1);  // [1, 2, 3, 4, 5, 6, 7, 8]

        intset1.retainAll(intset2);
        System.out.println("교집합 (Intersection): " + intset1); // [4, 5]

        intset1.removeAll(intset2);
        System.out.println("차집합:  (Difference)" + intset1); // [1, 2, 3]

        intset1.containsAll(intset2);
        System.out.println("부분집합? " + intset1); // true

    }
}
