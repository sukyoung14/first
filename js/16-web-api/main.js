// axios 불러오기
import axios from "axios";
// async / await
async function connectTest() {
  //axios.get(url) : 데이터 요청에 대한 응답 데이터를 반환(생성)
  const response = await axios.get(
    "https://jsonplaceholder.typicode.com/posts"
  );
  console.log(response);
  console.table(Object.entries(response));
  console.table(Object.keys(response));
  console.table(response["data"]);
}
connectTest();
