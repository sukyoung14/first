package e.generic;

public class GenericMethod {
    public static <T> void printArray(T[] array) {
        for (T itme : array) {
            System.out.println(itme);
        }
    }
    public static <T> void swap(T[] array, int i, int j) {
        T temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
    public static void main(String[] args) {
        Integer[] intArray = {1, 2, 3, 4, 5};
        //printArray(intArray);

        String[] stringArray = {"a", "b", "c", "d"};
        //printArray(stringArray);

        swap(intArray, 2, 4);
        printArray(intArray);

        swap(stringArray, 0, 2);
        printArray(stringArray);
    }
}
