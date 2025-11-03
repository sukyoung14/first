package a.basic;

public class If {
    public static void main(String[] args){
        int age = 20;
        if(age >= 18){
            System.out.println("성인입니다.");
        }
        int score = 80;
        if(score >= 90){
            System.out.println("A");
        } else if(score >= 80){
            System.out.println("B");
        } else if(score >= 70){
            System.out.println("C");
        }else {
            System.out.println("재수강");
        }

        // switch
        int month = 4;
        String season = switch (month){
            case 3,4,5 -> "봄";
            case 6,7,8 -> "여름";
            case 9,10,11 -> "가을";
            case 12,1,2 -> "겨울";
            default -> "잘못된 월";
        };

    }
}
