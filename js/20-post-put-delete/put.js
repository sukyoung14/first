import axios from "axios";
async function putProduct() {
  const config = {
    url: "https://dummyjson.com/products/1",
    method: "put",
    headers: { "Content-Type": "application/json" },
    data: {
      title: "아이폰 999",
    },
  };
  const response = await axios(config);
  const data = response["data"];
  console.log(data);
}
putProduct();
