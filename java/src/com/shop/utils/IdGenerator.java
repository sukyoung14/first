package com.shop.utils;

public class IdGenerator {
    private static IdGenerator instance;  // 싱글톤 인스턴스, 바깥에서 불러서 쓰는건, 전역적으로 선언!
    private int productIdCounter;         // 상품 ID 카운터,
    private int orderIdCounter;

    private IdGenerator() {    //초기값을 할당받은 생성자, 싱글톤 패턴용 생성자
        this.productIdCounter = 1;
        this.orderIdCounter = 1;
    }

    public static IdGenerator getInstance() {
        if (instance == null) {
            instance = new IdGenerator();
        }
        return instance;
    }

    public String generateProductId(){

        return "P" + productIdCounter++;
    }

    public String generateOrderId(){
        return "O" + orderIdCounter++;
    }
}
