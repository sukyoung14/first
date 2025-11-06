package a.basic;

import java.util.Arrays;

public class practice3 {
    public static void main(String[] args) {
        // 배열 최댓값/최솟값
        int[] numbers = {45, 23, 78, 12, 89, 34};
        Arrays.sort(numbers);
        System.out.println("최댓값: " + numbers[numbers.length -1]);
        System.out.println("최소값: " + numbers[0]);
        // 배열 뒤집기   - 배열을 역순으로 뒤집으세요.
        int[] arr = {1, 2, 3, 4, 5};
        Arrays.sort(arr);
        int[] arrCopy = Arrays.copyOf(arr, arr.length);
        int num = 0;
        for (int i = arr.length-1 ; i >= 0 ; i--) {
            arrCopy[i] = arr[num];
            num++;
        }
        int[] reversdNumbers = new int[arr.length];
        int[] reversdNumbers2 = Arrays.copyOf(arr, arr.length);
        for (int i = 0; i < arr.length; i++) {
            reversdNumbers[i] = arr[arr.length -1 -i];
        }
        int left = 0;
        int right = arr.length - 1;
        while (left < right) {
            int temp = reversdNumbers2[left];
            reversdNumbers2[left] = reversdNumbers2[right];
            reversdNumbers2[right] = temp;
            left++;
            right--;
        }

        System.out.println("원본: " + Arrays.toString(arr));
        System.out.println("뒤집기: " + Arrays.toString(arrCopy));
        System.out.println("뒤집기: " + Arrays.toString(reversdNumbers));
        System.out.println("뒤집기: " + Arrays.toString(reversdNumbers2));
        // 특정 값 찾기 - 배열에서 특정 값이 있는 인덱스를 찾으세요. 없으면 -1을 반환하세요.
        int[] arr2 = {10, 20, 30, 40, 50};
        int target = 40;
        int index = Arrays.binarySearch(arr2, target);
        if (index <= 0) {
            index =  - 1;
        }
        System.out.println(target + "의 인덱스: " + index);
        // 배열 요소 개수 세기 - 배열에서 각 숫자가 몇 번 나오는지 세세요.
        int[] arr3 = {1, 2, 2, 3, 3, 3, 4, 4, 4, 4,1,1,1,10};
        int max = 0;
        for (int num3 : arr3) {
            if(num3 > max){
                max = num3;
            }
        }
        int[] count =  new int[max +1];
        for (int num3 : arr3) {
            count[num3]++;
        }
        for (int i = 0; i < count.length; i++) {
            if (count[i] > 0) {
                System.out.println(i + " : " + count[i] + "번");
            }
        }
        // 2차원 배열 합계 - 2차원 배열의 모든 요소의 합을 구하세요.
        int[][] matrix = {
                {1, 2, 3},
                {4, 5, 6},
                {7, 8, 9}
        };
        int sum = 0;
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                sum += matrix[i][j];
            }
        }
        System.out.println("합계: " + sum);
        // 배열에서 두 번째로 큰 수
        int[] arr4 = {45, 23, 78, 12, 89, 34};
        Arrays.sort(arr4);
        System.out.println(arr4[arr4.length - 2]);
    }
}
