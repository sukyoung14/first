package e.generic;
class Student<T> {
    private String name;
    private T score;

    public Student(String name, T score) {
        this.name = name;
        this.score = score;
    }

    public String getName() {
        return name;
    }

    public T getScore() {
        return score;
    }

    public boolean isPassing(double passingScore) {
        if (score instanceof Number) {
            double scoreValue = ((Number) score).doubleValue();
            return scoreValue >= passingScore;
        }
        return false;
    }
}
public class StudentMain {
    public static void main(String[] args) {
        Student<Integer> s1 = new Student<Integer>("kim",100);
        System.out.print(s1.isPassing(90));
        //Student<Double> s1 = new Student<Double>("lee",95.5);
        Student<String> s3 = new Student<String>("lee","B+");

        Student<Integer>[] students = new Student[5];
        students[0] = new Student<Integer>("A",100);
        students[0] = new Student<Integer>("B",50);
    }
}
