package a.basic;

public class practice {
    public static void main(String[] args) {
        // 홀짝 판별 - 정수를 입력받아 홀수인지 짝수인지 판별하세요.
        int num = 17;
        if (num % 2 == 1) {
            System.out.println(num + "은 홀수입니다.");
        } else {
            System.out.println(num + "은 짝수입니다.");
        }
        // 학점 계산
        int score = 85;
        if (score >= 90) {
            System.out.println("A");
        } else if (score >= 80) {
            System.out.println("B");
        } else if (score >= 70) {
            System.out.println("C");
        } else if (score >= 60) {
            System.out.println("D");
        } else {
            System.out.println("F");
        }
        // 윤년 판별
        // 4로 나누어떨어지면서 100으로 나누어떨어지지 않거나
        // 400으로 나누어떨어지는 해
        int year = 2024;
        if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
            System.out.println(year + "년은 윤년입니다." );
        }
        // 삼각형 유효성 검사
        // 세 변의 길이가 모두 양수
        // 가장 긴 변 < 나머지 두 변의 합
        int a = 3, b = 4, c = 5;
        if (a > 0 && b > 0 && c > 0) {
            if (a + b > c && a + c > b && b + c > a) {
                System.out.println("삼각형을 만들 수 있습니다.");
            } else {
                System.out.println("삼각형을 만들 수 없습니다.");
            }
        } else {
            System.out.println("변의 길이는 모두 양수여야 합니다.");
        }
        // 계절 판별 - 월을 입력받아 계절을 출력하세요. switch 문을 사용하세요.
        int month = 7;
        String season = switch (month){
            case 3,4,5 -> "봄";
            case 6,7,8 -> "여름";
            case 9,10,11 -> "가을";
            case 12,1,2 -> "겨울";
            default -> "잘못된 월";
        };

        System.out.println(month+"월은 " + season + "입니다.");
        System.out.printf("%d월은 %s입니다.", month, season);
        // 요일 판별 - 요일 번호를 입력받아 평일/주말을 구분하세요. 향상된 switch 문을 사용하세요.
        int day = 4;
        String strDay = switch (day){
            case 1-> "월요일";
            case 2-> "화요일";
            case 3-> "수요일";
            case 4-> "목요일";
            case 5-> "금요일";
            case 6-> "토요일";
            case 7-> "일요일";
            default -> "잘못된 숫자";
        };
        String strDay2 = switch (day){
            case 1,2,3,4,5 -> "평일";
            case 6,7 -> "주말";
            default -> "잘못된 일";
        };
        System.out.println();
        System.out.printf("%d: %s은 %s입니다.", day, strDay, strDay2);
        System.out.println();
        // BMI 계산 및 판정 - 키(cm)와 몸무게(kg)를 입력받아 BMI를 계산하고 판정하세요.
        // BMI 계산: 몸무게(kg) / (키(m) × 키(m))
        double height = 175.0;  // cm
        double weight = 70.0;   // kg
        double heightMeter = height / 100;
        double BMI = weight / heightMeter * heightMeter;
        System.out.println("BMI: "+ BMI);
        if (BMI < 18.5) {
            System.out.println("저체중입니다");
        } else if (BMI >= 18.5 && BMI < 23) {
            System.out.println("정상입니다");
        } else if (BMI >= 123 && BMI < 25) {
            System.out.println("과체중입니다");
        } else {
            System.out.println("비만입니다");
        }
        // 최댓값 구하기 - 세 개의 정수 중 최댓값을 구하세요. if 문을 사용하세요.
        int d = 10, e = 25, f = 17;
        int max = d;
        if (e > max) {
            max = e;
        } else  if (f > max) {
            max = f;
        }
        System.out.println("최댓값 : " + max);
        // 시험 합격 여부 - 세 과목의 점수를 입력받아 합격 여부를 판단하세요.
        // 평균이 60점 이상, 모든 과목이 40점 이상
        int math = 70, english = 80, science = 39;
        double avg = (math + english + science) / 3.0 ;
        if ( avg >= 60 && (math >= 40 && english >= 40  && science >= 40 )) {
            System.out.println("합격");
        } else {
            System.out.println("불합격 (과목 낙제)");
        }
        // 할인율 계산 - 구매 금액에 따라 할인율을 적용하세요.
        // 10만원 이상: 10% 할인
        // 5만원 이상: 5% 할인
        // 5만원 미만: 할인 없음
        // 회원이면 추가 5% 할인
        int price = 120000;
        boolean isMember = true;
        int discount = 0;
        if (price >= 100000) {
            discount = 10;
        } else if (price >= 50000) {
            discount = 5;
        }
        if (isMember == true) {
            discount += 5;
        }
        System.out.println("원가: " + price + "원" );
        System.out.println("할인율 : " + discount + "%" );
        int totalPrice =  price - (price * discount / 100);
        System.out.println("최종 금액: " + totalPrice + "원" );

    }
}
