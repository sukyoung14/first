package a.basic;

public class practice2 {
    public static void main(String[] args) {
        // 2단부터 9단까지 구구단을 출력하세요.
        for (int i = 2; i < 10; i++) {
            for (int j = 1; j < 10; j++) {
                System.out.println(i + "X" + j + "=" + (i*j));
            }
        }
        // 별 찍기 패턴 1
        for (int i = 1; i <= 5; i++) {
            for (int j = i; j > 0; j--) {
                System.out.print("*");
            }
            System.out.println();
        }
        System.out.println();
        // 별 찍기 패턴 2
        for (int i = 5; i >= 1; i--) {
            for (int j = i; j >= 1; j--) {
                System.out.print("*");
            }
            System.out.println();
        }

        // 별 찍기 패턴 3
        for(int i = 1; i <= 5; i++){
            for (int j = 5; i <= j; j--){
                System.out.print(" ");
            }
            for (int j= 1; j <= 2*i-1; j++){
                System.out.print("*");
            }
            System.out.println();
        }

        int n = 5; // 패턴의 높이 (별의 줄 수)
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n - i; j++) {
                System.out.print(" ");
            }

            for (int j = 1; j <= 2 * i - 1; j++) {
                System.out.print("*");
            }
            System.out.println();
        }

        // 약수 구하기 - 주어진 숫자의 모든 약수를 출력하세요.
        int num = 24;
        System.out.print(num + "의 약수 :");
        for (int i = 1; i <= num; i++) {
            if (num % i == 0) {
                System.out.print(" " + i);
            }
        }
        System.out.println();
        // 소수 판별 - 1과 자기 자신으로만 나누어떨어지는 수
        num = 20;
        boolean isPrime = true;
        for (int i = 2; i < num; i++) {
            if (num % i == 0) {
                isPrime = false;
            }
        }
        if (isPrime){
            System.out.println(num + "은 소수입니다.");
        } else {
            System.out.println(num + "은 소수가 아닙니다.");
        }

        // 소수 판별 최적화 - 문제 6을 최적화하세요. 2부터 √num까지만 확인하면 됩니다.
        // num이 소수가 아니라면, num = a × b로 표현 가능합니다. 이때 a와 b 중 하나는 반드시 √num 이하입니다.
        num = 10;
        isPrime = true;
        for (int i = 2; i * i < num; i++) {
            if (num % i == 0) {
                isPrime = false;
            }
        }
        if (isPrime){
            System.out.println(num + "은 소수입니다.");
        } else {
            System.out.println(num + "은 소수가 아닙니다.");
        }

        // 최대공약수 (GCD) - 두 수의 최대공약수를 구하세요. 유클리드 호제법을 사용하세요.
        // gcd(a, b) = gcd(b, a % b)
        // a % b == 0이면 b가 최대공약수
        int a = 48, b = 18;

        while ( b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        System.out.println("최대공약수: " + a);

        // 최소공배수 (LCM)  - 두 수의 최소공배수를 구하세요.
        //  LCM(a, b) = (a × b) / GCD(a, b)
        a = 12;
        b = 18;
        int originA = a, originB = b;

        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        int gcd = a;
        System.out.println("최소공배수: " + originA * originB / gcd);
        // 피보나치 수열 - n번째 피보나치 수를 구하세요.
        // 피보나치 수열: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
        // 예상 출력: - 10번째 피보나치 수: 34
        n = 9;
        int fib1 = 0, fib2 = 1;
        int result = 0;
        for (int i = 1; i < n; i++) {
            result = fib1 + fib2;
            fib1 = fib2;
            fib2 = result;
        }
        System.out.println(n + "번째 피보나치 수:  " + result);
        // 팩토리얼 - n!을 계산하세요.
        n = 5;
        int total = 1;
        for  (int i = 1; i <= n; i++) {
            total *= i;
        }
        System.out.println(n + "! : " + total);

        // 역순 숫자 출력 - 정수를 역순으로 출력하세요.
        num = 12345;
        String strNum = String.valueOf(num);
        for (int i = strNum.length()-1; i >= 0; i--) {
            System.out.print(strNum.charAt(i));
        }
        System.out.println();
        while (num > 0){
            System.out.print(num % 10);
            num = num / 10;
        }
        System.out.println();
        // 숫자 자릿수 합 - 정수의 각 자릿수를 더하세요.
        num = 12345;
        strNum = String.valueOf(num);
        int sum = 0;
        for (int i = 0; i < strNum.length(); i++) {
            sum += strNum.charAt(i) - '0';
        }
        System.out.println("숫자 자릿수 합 :" +sum);
        sum = 0;
        while (num > 0){
            sum += num % 10;
            num = num / 10;
        }
        System.out.println("숫자 자릿수 합 :" +sum);
        System.out.println();

        // 구구단 특정 단 건너뛰기 - 2단부터 9단까지 구구단을 출력하되, 5단은 건너뛰세요. continue를 사용하세요.
        for (int i = 2; i <= 9; i++) {
            if (i == 5) {
                continue ;
            }
            for (int j = 1; j <= 9; j++) {
                System.out.println(i + "X" + j + "=" + (i*j));
            }
        }
    }
}
