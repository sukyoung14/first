package f.collection;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class ArrayListMain {
    public static void main(String[] args) {
        ArrayList<String> l = new ArrayList<>();
        l.add("apple");
        l.add("orange");

        l.add(0, "cherry");
        System.out.println(l);

        String t = l.get(0);
        System.out.println(t);

        l.set(2, "grape");
        System.out.println(l);

        l.remove(0);
        l.remove("apple");
        System.out.println(l);
        // 크기 확인
        System.out.println("크기: " + l.size());

        // 비어있는지 확인
        System.out.println("비어있음? " + l.isEmpty());

        // 포함 여부 확인
        System.out.println("Banana 포함? " + l.contains("grape"));

        ArrayList<Integer> intList = new ArrayList<>();
        intList.addAll(Arrays.asList(5,2,9,3,10,11,15));

        System.out.println(intList);

        int index = intList.indexOf(9);
        System.out.println(index);

        int lastIndex = intList.lastIndexOf(11);
        System.out.println(lastIndex);

        List<Integer> sublist = intList.subList(2, 4);
        System.out.println(sublist);

        //intList.clear();
        //System.out.println(intList);

        Integer[] array = intList.toArray(new Integer[0]);
        System.out.println(Arrays.toString(array));

        System.out.println("for-each");
        for (Integer num : intList) {
            System.out.print(num);
        }

        System.out.println("\nindex for");
        for (int i = 0; i < intList.size(); i++) {
            System.out.print(intList.get(i));
        }

        System.out.println("\niterator");
        Iterator<Integer> iterator = intList.iterator();
        while(iterator.hasNext()) {
            System.out.print(iterator.next());
        }



    }
}
