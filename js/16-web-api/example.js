import axios from "axios";
// 도메인주소
const BASE_URL = "https://dummyjson.com";
const testRoute = async () => {
  // async 화살표 함수
  //   fetch('https://dummyjson.com/test')
  // .then(res => res.json())
  // .then(console.log);
  const data = await axios.get(`${BASE_URL}/test`);
  console.log(data["data"]);
};
//testRoute();

async function getAllProducts() {
  const response = await axios.get(`${BASE_URL}/products`);
  // console.log(response["data"]);
  // console.table(Object.entries(response["data"]));
  const data = response["data"];
  const products = data["products"];
  console.log(products);
}

//getAllProducts();

async function getProductTotalCount() {
  const response = await axios.get(`${BASE_URL}/products`);
  const data = response["data"];
  console.log(data["total"]);
}

//getProductTotalCount();

const getProductProperty = async () => {
  const response = await axios.get(`${BASE_URL}/products`);
  const data = response["data"];
  const products = data["products"];
  console.log(products);
};
getProductProperty();
