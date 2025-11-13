package e.generic;

class Pair<K,V>{
    private K key;
    private V value;

    public Pair(K key, V value) {
        this.key = key;
        this.value = value;
    }

    public K getKey() {
        return key;
    }

    public V getValue() {
        return value;
    }

    @Override
    public String toString() {
        return "Pair{" +
                "key=" + key +
                ", value=" + value +
                '}';
    }
}
public class MultiType {
    public static void main(String[] args) {
        Pair<String, Integer> pair = new Pair<>("a", 1);
        System.out.println(pair.toString());
        Pair<Integer, String> pair2 = new Pair<>(1, "a");
        System.out.println(pair2.toString());
    }
}
