package d.Inheritance;

class Phone{
    String brand;
    String model;
    int batterLevel;

    void powerOn() {
        System.out.println(model + " Power on");
    }

    void charge() {
        batterLevel = 100;
        System.out.println("finish!!");
    }
}
class Iphone extends Phone {
    String ios;
    void useFaceId(){
        System.out.println("using FaceId");
    }
}
class Galaxy extends Phone {
    String android;
    void useSPen() {
        System.out.println("using SPen");
    }
}

public class PhoneMain {
    public static void main(String[] args) {
        Iphone i = new Iphone();
        Galaxy g = new Galaxy();
        i.model = "16 pro";
        i.brand = "apple";
        i.ios = "26.1";
        i.powerOn();
        i.charge();
        i.useFaceId();

        g.model = "s25";
        g.brand = "samsung";
        g.android = "25";
        g.powerOn();
        g.charge();
        g.useSPen();
    }
}
