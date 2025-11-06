package c.oop2;

public class Account {
    private String name;
    private int age;
    private String phone;
    private String address;

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Account(String name, int age, String phone, String address) {
        setName(name);
        setAge(age);
        setPhone(phone);
        setAddress(address);
    }
}
