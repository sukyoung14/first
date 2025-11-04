package a.basic;

public class For {
    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            System.out.println(i);
        }
        System.out.println();
        for (int i = 10; i >= 1; i--) {
            System.out.println(i);
        }
        System.out.println();
        for (int i = 0; i < 10; i+=2) {
            System.out.println(i);
        }
        System.out.println();
        for (int i = 0, j = 10;  i < j; i++, j--) {
            System.out.println(i + " - " + j);
        }
        int dan = 2;
        for ( int i = 1 ; i <=9; i++){
            System.out.println(dan + "X" + i + "=" + (dan*i));
        }
        // 구구단
        for ( int nDan = 2 ; nDan <=9; nDan++){
            for ( int i = 1 ; i <=9; i++){
                System.out.println(nDan + "X" + i + "=" + (nDan*i));
            }
        }

        // enhanced for
        int[] numbers = {10, 11, 12, 13};
        for ( int i = 0 ; i < numbers.length; i++){
            System.out.println(numbers[i]);
        }
        for (int number:numbers){
            System.out.println(number);
        }

        int[] nums = {1,2,3};
        for ( int num : nums){
            num = num * 3;
        }
        for (int num : nums) {
            System.out.println(num);    // 1,2,3
        }
        for (int a=0; a < nums.length; a++){
            nums[a] = nums[a] *3 ;
        }
        for (int num : nums) {
            System.out.println(num);    // 3,6,9
        }
        for (int i = 0; i <= 10; i++){
            System.out.println(i);
            if (i == 5) break;
        }
        // 구구단
        outer:
        for ( int nDan = 2 ; nDan <=9; nDan++){
            for ( int i = 1 ; i <=9; i++){
                System.out.println(nDan + "X" + i + "=" + (nDan*i));
                if (nDan > 4){
                    break outer;
                }
            }
        }
    }
}
