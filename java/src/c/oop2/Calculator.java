package c.oop2;

import java.util.Arrays;

class Sample {
    int value;
}

public class Calculator {
    int add (int a, int b) {
        return a + b;
    }

    int add (int a, int b, int c) {
        return a + b + c;
    }

    int add (int... numbers){
        //System.out.println("Adding " + Arrays.toString(numbers));
        int sum = 0;
        for (int number:numbers){
            sum += number;
        }
        return sum;
    }

    void printResult(int result)
    {
        System.out.println(result);
    }
    String  PrintValue(int score)
    {
        if (score >= 50) return "pass";
        else return "fail";
    }
    int[] getArray() {
        return new int[] {1, 3, 5, 7, 9};
    }
    Sample getSample() {
        return new Sample();
    }
}

