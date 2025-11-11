package d.Inheritance.practice;

class Vehicle  {
    String model;
    double dailyRate ;

    public Vehicle(String model, double dailyRate) {
        this.model = model;
        this.dailyRate = dailyRate;
    }

    public int calculateRentalCost(int days) {
        return (int) dailyRate * days;
    }
}
class Car extends Vehicle {
    boolean hasGPS;

    public Car(String model, double dailyRate, boolean hasGPS) {
        super(model, dailyRate);
        this.hasGPS = hasGPS;
    }

    @Override
    public String toString() {
        return "Car{ model='" + model + ", dailyRate=" + (int)dailyRate  + ", hasGPS=" + hasGPS + "}";
    }

    @Override
    public int calculateRentalCost(int days) {
        double tot =  super.calculateRentalCost(days) ;
        if (hasGPS) {
            tot += (days * 1000);
        }
        return  (int) tot ;
    }
}
class Truck extends Vehicle {
    double capacity;

    public Truck(String model, double dailyRate, double capacity) {
        super(model, dailyRate);
        this.capacity = capacity;
    }

    @Override
    public String toString() {
        return "Truck{ model='" + model + ", dailyRate=" + (int)dailyRate + ", capacity=" + capacity + "톤 }";
    }

    @Override
    public int calculateRentalCost(int days) {
        double tot =  super.calculateRentalCost(days) + (capacity * 5000 * days);
        return  (int) tot;
    }

}
public class VehicleMain {
    public static void main(String[] args) {
        Car car = new Car("소나타", 50000, true);
        Truck truck = new Truck("포터", 70000, 1.5);

        System.out.println(car);
        System.out.println("3일 대여료: " + car.calculateRentalCost(3) + "원");

        System.out.println(truck);
        System.out.println("5일 대여료: " + truck.calculateRentalCost(5) + "원");
    }
}
