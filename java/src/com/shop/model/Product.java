package com.shop.model;

import com.shop.utils.IdGenerator;

public class Product {
    private String id;        // 상품 ID (자동 생성)
    private String name;      // 상품명
    private int price;        // 가격
    private int stock;        // 재고
    private String category;  // 카테고리

    public Product(String name, int price, int stock, String category) {
        this.id = IdGenerator.getInstance().generateProductId();
        setName(name);     // setter를 통한 유효성 검증
        setPrice(price);
        setStock(stock);
        setCategory(category);
    }

    public String getId() {
        return id;
    }

    public void setCategory(String category) {
        if (category == null){
            throw new IllegalArgumentException("Category명은 필수입니다.");
        }
        this.category = category;
    }

    public void setStock(int stock) {

        if (stock < 0 ) {
            throw  new IllegalArgumentException("재고는 0 이상이어야 합니다.");
        }
        this.stock = stock;
    }

    public void setPrice(int price) {
        if (price < 0) {
            throw new IllegalArgumentException("가격은 0 이상이어야 합니다.");
        }

        this.price = price;
    }

    public void setName(String name) {
        if (name == null) { //빈 문자열일떄는 아래 메시지를 출력하고, 아니면 메인을 넘겨라
            throw new IllegalArgumentException("상품명은 필수입니다.");
        }
        this.name = name;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public int getStock() {
        return stock;
    }

    public String getCategory() {
        return category;
    }


    public void decreaseStock(int quantity) {
        if (quantity < 0) {
            throw new IllegalArgumentException("수량이 0보다 커야합니다");
        }
        if (stock < quantity) {
            throw new IllegalArgumentException("재고가 부족합니다.");
        }
        stock -= quantity;
    }

    public void increaseStock(int quantity) {
        if (quantity < 0) {
            throw new IllegalArgumentException("수량이 0보다 커야합니다.");
        }
        stock += quantity;
    }

    public boolean isAvailable(int quantity) {
        return stock >= quantity; //재고가 충분하면 true, 아니면 false를 반환함.
    }

}
