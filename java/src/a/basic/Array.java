package a.basic;

public class Array {
    public static void main(String[] args) {
        int [] numbers = new int[5];
        numbers[0] = 100;
        numbers[1] = 200;

        System.out.println(numbers.length);
        System.out.println(numbers[0]);
        System.out.println(numbers[4]);

        int[] arr1 = new int[5];
        arr1[0] = 1;
        arr1[1] = 2;
        arr1[2] = 3;

        int[] arr2 = new int[] {1,2,3,4,5};
        int[] arr3 = {1,2,3,4,5};
        String[] names = {"kim", "lee", "park"};

        System.out.println(names.length);
        
        int[] scores = {80, 40, 80, 90, 100};
        // index 접근
        for (int i = 0; i < scores.length; i++) {
            System.out.println(scores[i]);
        }
        // 요소 반복
        for (int score : scores) {
            System.out.println(score);
        }
        int[][] matrix = {
                {1,2,3},
                {4,5,6},
                {7,8,9}
        };
        //System.out.println(matrix[1][2]);
        for (int i=0;i<matrix.length;i++){
            for (int j=0;j< matrix[i].length ;j++){
                System.out.println( i +" + " + j +  " - " + matrix[i][j]);
            }
        }
        int[][] jagged = {
                {1},
                {2,3},
                {4,5,6},
                {7,8,9,10}
        };
        for (int[] row: jagged){
            for (int item : row)
            {
                System.out.print(item);
            }
            System.out.println();
        }

    }
}
