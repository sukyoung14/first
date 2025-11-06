package c.oop2;
class Data {
    int value;
}

public class Referprarms {
    // 5. A 객체를 가지고 (같은주소를 참조)와서 value를 99로 변경 
    void changeValue(Data d) {
        d.value = 99;
        // 6. 출력
        System.out.println("changeValue - " + d.value);
    }
    public static void main(String[] args) {
        // 1.Refer 인스턴스화
        Referprarms ref = new Referprarms();
        // 2. Data 인스턴스화
        Data d = new Data();
        // 3. Data 객체(A)에 데이터 10 할당
        d.value = 10;
        // 4. changeValue에 A 대입
        ref.changeValue(d);
        // 7. d => A 객체
        System.out.println( "main - " + d.value);
    }
}
