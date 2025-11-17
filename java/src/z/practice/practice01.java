package z.practice;

import java.util.*;

public class practice01 {
    public static void main(String[] args) {
        LinkedList<String> list = new LinkedList<>();
        LinkedList<Integer> list1 = new LinkedList<>(Arrays.asList(5, 3, 9, 1, 7));
        System.out.println(list1);

        HashSet<Integer> list2 = new HashSet<>(Arrays.asList(5, 3, 9, 1, 7, 6, 6, 0));
        TreeSet<Integer> list3 = new TreeSet<>();
        list3.add(5);
        list3.add(3);
        list3.add(9);
        System.out.println(list3);

        TreeMap<String, Integer> map = new TreeMap<>();
        map.put("1", 1500);
        map.put("3", 1000);
        map.put("4", 2000);
        map.put("2", 2500);

        System.out.println(map); // 키 기준 오름차순 정렬
    }
}
