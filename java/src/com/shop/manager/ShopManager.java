package com.shop.manager;

import com.shop.model.Order;
import com.shop.model.Product;

public class ShopManager {

    private Product[] products;  // 상품 배열 (크기 50)
    private int productCount;    // 현재 등록된 상품 수
    private Order[] orders;      // 주문 배열 (크기 50)
    private int orderCount;      // 현재 주문 수

    public ShopManager() {
        products = new Product[50];
        productCount = 0;
        orders = new Order[50];
        orderCount = 0;
    }



    public void addProduct(Product product){
        // 배열이 가득 찼는지 확인
        //products[productCount++] = product
        //등록 메시지 출력
        //예시: System.out.println("[상품 등록] " + product.getName() + " - " + product.getPrice() + "원");

        if (productCount >= products.length){
            throw new RuntimeException("배열이 가득 찼습니다");
        }

        products[productCount++] = product;
        System.out.println("[상품 등록] " + product.getName() + " - " + product.getPrice() + "원");
    }

    public Product findProductById(String id){
        // 반복문으로 products 배열 순회
        //id가 일치하면 해당 Product 반환
        //못 찾으면 null 반환
        for (int i = 0; i<productCount; i++){
            if (products[i].getId().equals(id)){
                return products[i];
            }
        }
        return null;
    }

    public Product[] searchProductsByName(String keyword){
        // 임시 배열 생성 (크기 productCount)
        Product[] productsList = new Product[productCount];
        int Pcount = 0;

        //상품명에 keyword가 포함되면 임시 배열에 추가

        for (int i = 0; i < productCount; i++){
            if (products[i].getName().toLowerCase().contains(keyword.toLowerCase())){
                productsList[Pcount] = products[i];
                Pcount++;
            }
        }

        //결과 개수만큼 새 배열 생성하여 반환
        return productsList;
        //결과 개수만큼 새 배열 생성하여 반환

    }

    public Product[] searchProductsByCategory(String category){
        //searchProductsByName과 유사
        //카테고리가 일치하는 상품 찾기
        //힌트: category.equalsIgnoreCase(keyword)  -> 어차피 대소문자 구분없이 두 문자열이 같은지 확인하는 메써드
        //카테고리가 일치하는 상품(product - 상품명,ID,재고,카테고리 등)을 찾기!
        Product[] categoryList = new Product[productCount];
        int Ccount = 0;

        for (int i = 0; i < productCount; i++){
            if (products[i].getCategory().equalsIgnoreCase(category)){
                categoryList[Ccount] = products[i];
                Ccount++;
            }
        }
        return categoryList;
    }

    public void printAllProducts(){
        //반복문으로 모든 상품 출력
        //형식: "번호. [ID] 상품명 - 가격원 (재고: N개)"
        //예시: System.out.println((i+1) + ". [" + p.getId() + "] " + p.getName() + " - " + p.getPrice() + "원 (재고: " + p.getStock() + "개)");

        for  (int i = 0; i < productCount; i++){
            System.out.println((i+1) + ". [" + products[i].getId() + "] " + products[i].getName() + " - " + products[i].getPrice() + "원 (재고: " + products[i].getStock() + "개)");
        }
    }

    public Order createOrder() {
        //새 Order 객체 생성
        Order order = new Order();
        //생성 메시지 출력
        //System.out.println("Order가 생성되었습니다!");
        System.out.println("[주문 생성] " + order.getOrderId());
        //Order 반환
        return order;
    }



    public void addOrderItem(Order order, String productId, int quantity){
        //findProductById()로 상품 찾기
        Product foundProduct = findProductById(productId);

        //상품이 없으면 에러 메시지 출력 후 return
        if  (foundProduct == null){
            throw new RuntimeException("상품이 없습니다!");
        }
        //isAvailable()로 재고 확인
        //재고 부족시 에러 메시지 출력 후 return
        if (!foundProduct.isAvailable(quantity)){
            System.out.println("재고가 부족합니다. 현재 재고: " + foundProduct.getStock());
            return;
        }

        //order.addItem() 호출 // 주문에 아이템 추가
        order.addItem(foundProduct.getId(), quantity);
        //System.out.println("상품이 주문에 추가되었습니다: " + foundProduct.getName());
        System.out.println("[주문 항목 추가] " + foundProduct.getName() + " x " + quantity );
        //추가 완료 메시지 출력
    }

    public void processOrder(Order order) {
        //order.calculateTotal(this) 호출, 총 금액 계산
        order.calculateTotal(this); //주문 처리할 거의 총금액 계산

        //주문 내역 출력 (상품명, 수량, 금액)
        System.out.println("===== 주문 내역 =====");

        for (int i = 0; i < order.getItemCount(); i++) {
            String productId = order.getProductIds()[i];
            int quantity = order.getQuantities()[i];

            Product foundProduct = findProductById(productId);

            if (foundProduct != null){
                System.out.println(foundProduct.getName() +" - " + quantity + "개, 가격 : " + foundProduct.getPrice());
            }

        }

        //반복문으로 재고 차감 (product.decreaseStock())
        for (int i = 0; i < order.getItemCount(); i++) {
            String productId = order.getProductIds()[i];
            int quantity = order.getQuantities()[i];
            Product foundProduct = findProductById(productId);

            if (foundProduct != null){
                foundProduct.decreaseStock(quantity);
            }
        }
        //order.complete() 호출, 주문 상태 완료로 변경
        order.complete();

        //orders 배열에 추가, 주문 목록에 추가
        if (orderCount < orders.length) {
            orders[orderCount++] = order;
        };

        //결제 완료 메시지 출력
        System.out.println(" 결제가 완료되었습니다. 주문 ID: " + order.getOrderId());
    }

    public Order findOrderById(String orderId) {
        //반복문으로 orders 배열 순회
        //orderId가 일치하면 반환
        //못 찾으면 null 반환
        for (int i = 0; i<orderCount; i++){
            if (orders[i].getOrderId().equals(orderId)){
                return orders[i];
            }
        }
        return null;
    }
    public void printAllOrders(){
        System.out.println("=== 전체 주문 === ");
        for (int i = 0; i < orderCount; i++){
            Order order = orders[i];
            System.out.println((i+1) + ". [" + orders[i].getOrderId() + "] " + order.getTotalAmount()  + "원 (" + order.getStatus()+ ")" );
        }
    }

}
















