package b.oop.practice;

public class Counter {
    public int count ;
    public Counter() {
        this.count = 0;
    }
    void  increment() {
        this.count += 1;
    }
    void  decrement() {
        this.count -= 1;
    }
    public int getCount() {
        return count;
    }
    void reset() {
        this.count = 0;
    }

}
