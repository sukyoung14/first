package g.javaclass;

public class WrapperMain {
    public static void main(String[] args) {
        int primitive = 10;
        Integer wrapper = Integer.valueOf(primitive);
        System.out.println(wrapper);

        Integer wrapper2 = Integer.valueOf(20);
        int primitive2 = wrapper.intValue();
        System.out.println(primitive2);

        Integer w = null;

        // 문자열 파싱
        int parsed = Integer.parseInt("123");
        System.out.println(parsed);

        Integer a = 10;
        Integer b = 20;
        System.out.println(a.compareTo(b));
    }
}
