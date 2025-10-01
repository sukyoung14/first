import React from "react";
import axios from "axios";
import { useEffect, useState } from "react";
import Product from "./Product";
export default function RequestData() {
  const [products, setProducts] = useState([]);
  useEffect(() => {
    // axios를 사용해서 DummyJSON Products 데이터 요청
    // await를 사용하기 위해서는 async function 필요
    async function getProducts() {
      const response = await axios("https://dummyjson.com/products");
      const data = response["data"];
      console.log(data);
      setProducts(data["products"]);
    }
    getProducts();
  }, []); //빈 의존성 배열 : 컴포넌트가 첫 랜더링될때만 콜백함수가 실행
  return (
    <div>
      {/* products : 배역 */}
      {/* map : 반복 메서드 */}
      {/* product : 반복되는 배열의 원소 */}
      {products.map((product) => {
        // 매개변수 product를 Product 컴포넌트에 Props로 전달
        // 속성명 : product / 값 : 매개변수 product를
        return <Product key={product.id} product={product}></Product>;
      })}
    </div>
  );
}
