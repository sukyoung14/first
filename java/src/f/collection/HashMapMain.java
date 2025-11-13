package f.collection;


import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class HashMapMain {
    public static void main(String[] args) {
        HashMap<String, Integer> map = new HashMap<>();

        map.put("Apple", 1000);
        map.put("Banana", 2000);
        map.put("Cherry", 3000);
        System.out.println(map);
        // 값 가져오기
        int price = map.get("Apple");
        System.out.println(price);
        System.out.println(map.containsKey("Banana"));       // 키 존재 확인
        System.out.println(map.containsValue(2000));        // 값 존재 확인

        map.put("Apple", 5000);     // 값 수정 (같은 키로 put하면 덮어씀)
        System.out.println(map);

        //map.remove("Banana");        // 요소 삭제
        System.out.println("크기: " + map.size());

        //map.clear();
        System.out.println("비어있음? " + map.isEmpty());

        // 2. getOrDefault() - 키가 없으면 기본값 반환
        System.out.println(map.getOrDefault("Durian", 0));

        // 3. containsKey()로 확인 후 접근
        if (map.containsKey("Durian")) {
            System.out.println("Durian : " + map.get("Durian"));
        }

        // 4. putIfAbsent() - 키가 없을 때만 추가
        map.putIfAbsent("Durian", 100); // 없으므로 추가
        map.putIfAbsent("Apple", 9999); // 이미 있으므로 무시
        System.out.println(map);
        System.out.println(map.keySet());       // 키 리스트

        for (String key : map.keySet()) {
            System.out.println(key + " : " + map.get(key));
        }
        for (Integer value  : map.values()) {
            System.out.println(value);
        }

        for (Map.Entry<String, Integer> entry: map.entrySet()) {
            System.out.println(entry.getKey() + " = " + entry.getValue());
        }
    }
}
