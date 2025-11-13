package e.generic;
import java.util.*;

public class WildCardGeneric {
    public static void printList(List<?> list){
        for (Object o : list){
            System.out.println(o);
        }
    }
    public static void main(String[] args) {
        // int[] intList = {1,2,3}
        List<Integer> intlist = Arrays.asList(1,2,3);
        List<Double> doublelist = Arrays.asList(1.0,2.0,3.0);
        List<String> stringlist = Arrays.asList("a","b","c");
        printList(intlist);
        printList(doublelist);
        printList(stringlist);

//        intlist.add(4);
//        intlist.add(5);

        List<? extends Number> list = intlist;
        list.get(0);
        //list.add(4);       // 상한 경계 와일드카드를 사용하면 읽기는 가능하지만 쓰기는 불가능합니다. 쓰기 불가능

        List<Number> numberList = new ArrayList();
        List<? super Integer> list2 = intlist;

        Object a = list2.get(0);
        //list2.get(0);     // 하한 경계 와일드카드를 사용하면 쓰기는 가능하지만 읽기는 제한적입니다. 읽기 불가능
    }
}
