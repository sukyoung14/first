# 공통

- 길이 : length
- 카멜케이스 : 속성명의 첫 글자를 소문자로 작성하고, 나머지 단어의 첫 글자를 대문자로 작성하는 방법

# HTML

- <input> 태그의 placeholder 속성 : 사용자가 아무것도 입력하지 않았을 때 임시로 나타나는 회색 글씨
- <input> 태그의 required 속성 : 필수입력

# CSS

- font-weight : b태그 - 굵기 지정
- vw (뷰포트 너비) vh (뷰포트 높이)
- em -
- rem - 기본값: 16px 사용자가 지정한 폰트
- margin: 외부 여백
- padding: 내부 여백

# Tailwind CSS
- cursor-pointer - 손모양
# 자바스크립트
 
 - axios
``` 
	import axios from "axios";
	const BASE_URL = `https://dummyjson.com`;
	async function getProducts() {
	const response = await axios.get(`${BASE_URL}/products`);
      const data = response["data"];
      console.log(data);
    }
getProducts();
```

# 리액트

- JSX 보간법 : {}
- 명명 규칙 : handle
- 컴포넌트 : import MyList from "./components/Component/MyList"; MyList명은 대문자로 시작해야 한다.
- ```event 함수에서 value 값
  const elements = event["target"]["elements"];
   const { email, password, name } = elements;
  console.log(`이름 입력 값: ${name["value"]}`);
  ```
  ``` console.log(`이름 입력 값: ${event["target"]["value"]}`);  ```
-     event.preventDefault(); - onSubmit에서 멈추는
- Props
  - 함수 전달: onClick={handleClick} 소괄호 없음
  - 함수 호출: onClick={() => onClick()} 소괄호 있음
- useState, useEffect
```
	import { useEffect, useState } from "react";
	  const [data, setData] = useState([]); 
	useEffect(() => {}, []); //빈 의존성 배열 : 컴포넌트가 첫 랜더링될때만 콜백함수가 실행
```
- map
```
	{products.map((product) => {
        // 매개변수 product를 Product 컴포넌트에 Props로 전달
        // 속성명 : product / 값 : 매개변수 product를
        return <Product key={product.id} product={product}></Product>;
      })}
```
- TMDB 
	- .env : config 파일(환경변수)
	- VITE_TMDB_API_KEY=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZTI5NzE3MjY4NjMzYjE4YmVlZTk3Yzg3YzBjMDQ1NSIsIm5iZiI6MTU2ODg3Njk5MS4wMSwic3ViIjoiNWQ4MzI5YmYxNjJiYzMwMjI3ZGRmY2Q2Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.K4Rfgg3rBpZHzkWitF3lASxkW7LXnd2nZFDkzmb3e5c
```
const BASE_URL = `https://api.themoviedb.org/3`;
const API_KEY = import.meta.env["VITE_TMDB_API_KEY"];
const [movies, setMovies] = useState([]);

  useEffect(() => {
    async function fetchData() {
      const config = {
        method: "GET",
        url: `${BASE_URL}/movie/popular`,
        headers: {
          "Content-Type": "application/json",
          accept: "application/json",
          Authorization: `Bearer ${API_KEY}`,
        },
        params: {
          language: "ko-KR",
          page: 1,
        },
      };

      const res = await axios(config);
      setMovies(res["data"]["results"]);
    }

    fetchData();
  }, []);
  {movies.map((movie) => (
          <li key={movie.id}>{movie.title}</li>
        ))}
  ```
  - import axios from "."; // . 은 index를 가지고 온다는 의미
  - export default axiosInstance;		// 한개만 내보내기
  - export { axiosInstance, axiosInstance2 };	// 여러개 내보내기
  - export는 함수 앞에 써도 됨
  ```export async function getPopularMovies() {}
  import { getPopularMovies } from "./../../api/tmdb";```
