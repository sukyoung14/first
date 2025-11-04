package a.basic;

public class While {
    public static void main(String[] args) {
        int i = 100;
        while(i<10){
            System.out.println(i);
            i++;
        }
        // do-while : 조건을 나중에 검사하므로 최소 1회는 실행됩니다.
        int j = 100;
        do {
            System.out.println(j);
            j++;
        } while (j<10);
    }
}
