import axios from "axios";

async function addProduct() {
  const URL = "https://dummyjson.com/products/add";
  const mothod = "post";
  const body = {
    title: "갤럭시 s999",
    category: "스마트폰",
  };
  const headers = {
    "Content-Type": "application/json",
  };

  const config = {
    url: URL,
    mothod: mothod,
    headers: headers,
    data: body,
  };
  const response = await axios(config);
  const data = response["data"];
  console.log(data);
}

addProduct();
