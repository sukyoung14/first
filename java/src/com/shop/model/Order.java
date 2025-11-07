package com.shop.model;

import com.shop.manager.ShopManager;
import com.shop.utils.IdGenerator;

public class Order {
    private String orderId;           // 주문 ID (자동 생성)
    private String[] productIds;      // 주문한 상품 ID 배열 (크기 10)
    private int[] quantities;         // 각 상품의 수량 배열 (크기 10)
    private int itemCount;            // 현재 담긴 상품 종류 수
    private int totalAmount;          // 총 금액
    private String status;            // 주문 상태: "결제대기", "결제완료", "취소"

    public Order() {
        this.orderId = IdGenerator.getInstance().generateOrderId();
        this.productIds = new String[10];
        this.quantities = new int[10];
        this.itemCount = 0;
        this.totalAmount = 0;
        this.status = "결제대기";
    }


    public String getOrderId() {
        return orderId;
    }

    public String[] getProductIds() {
        return productIds;
    }

    public int[] getQuantities() {
        return quantities;
    }

    public int getItemCount() {
        return itemCount;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void addItem(String productId, int quantity) {
        // 배열이 가득 찼는지 확인 (itemCount >= 10)
        //수량이 1 이상인지 확인
        //productIds[itemCount]에 상품 ID 저장
        //quantities[itemCount]에 수량 저장
        //itemCount 증가

        if  (this.itemCount >= productIds.length) {
            throw new IllegalArgumentException("현재 배열이 가득찼습니다,");
        }

        if (quantity < 1) {
            throw new IllegalArgumentException("수량이 1 이상이어야합니다.");
        }

        this.productIds[this.itemCount] = productId;
        this.quantities[this.itemCount] = quantity;

        itemCount++;
    }

    public void calculateTotal(ShopManager manager) {
        //totalAmount를 0으로 초기화
        //반복문으로 모든 상품 순회 (0부터 itemCount-1까지)
        //manager.findProductById()로 상품 찾기
        //totalAmount += product.getPrice() * quantities[i]

        totalAmount = 0;
        for (int i = 0; i <= this.itemCount-1; i++) {
           String productId = this.productIds[i];
           int quantity = this.quantities[i];

           Product pro = manager.findProductById(productId);
           if (pro != null) {
               totalAmount += pro.getPrice() * quantity;
           }
        }

    }

    public void complete(){
        // status를 "결제완료"로 변경
        System.out.println("complete - ");
        this.status = "결제완료";
    }

}












