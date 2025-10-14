# 공통

 - 길이 : length  <!--변수명.length-->
 - 카멜케이스 : 속성명의 첫 글자를 소문자로 작성하고, 나머지 단어의 첫 글자를 대문자로 작성하는 방법

# HTML

 - <input> 태그의 placeholder 속성 : 사용자가 아무것도 입력하지 않았을 때 임시로 나타나는 회색 글씨
 - <input> 태그의 required 속성 : 필수입력
 - HTML 요소를 구성하는 태그, 속성, 컨텐츠
	1. 태그 : 요소의 기능을 나타내고 시작 태그 <>와 종료 태그 </>로 구성된다
	2. 속성 : 요소의 추가 특성을 나타내고, 시작 태그 내부에 작성한다.
	3. 내용 : 화면에 표시할 텍스트 또는 또 다른 요소를 작성한다. 
 - HTML 속성 중 class 속성의 역할 : 요소를 그룹화하기 위해 사용
 - JavaScript 원시 자료형 중 기본 자료형 3개
	String Number Boolean
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
 - 터미널에서 실행 : node 파일명

 
 ##  axios
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

 ##  JSX 보간법 : {}
 ##  명명 규칙 : handle
 ##  컴포넌트 : import MyList from "./components/Component/MyList"; MyList명은 대문자로 시작해야 한다.
- ```event 함수에서 value 값
  const elements = event["target"]["elements"];
   const { email, password, name } = elements;
  console.log(`이름 입력 값: ${name["value"]}`);
  ```
  ``` console.log(`이름 입력 값: ${event["target"]["value"]}`);  ```
-     event.preventDefault(); - onSubmit에서 멈추는
 ##  Props
  - 함수 전달: onClick={handleClick} 소괄호 없음
  - 함수 호출: onClick={() => onClick()} 소괄호 있음
 ##  useState, useEffect
```
	import { useEffect, useState } from "react";
	  const [data, setData] = useState([]); 
	useEffect(() => {}, []); //빈 의존성 배열 : 컴포넌트가 첫 랜더링될때만 콜백함수가 실행
```
 ##  map
```
	{products.map((product) => {
        // 매개변수 product를 Product 컴포넌트에 Props로 전달
        // 속성명 : product / 값 : 매개변수 product를
        return <Product key={product.id} product={product}></Product>;
      })}
```
 ## TMDB 
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

      const res = await axios(config);/ㄹ567ㄹ
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
 ## 라우터(router)
 - src/router/index.js 파일에
 ```	import { createBrowserRouter } from "react-router-dom";	
 const router = createBrowserRouter([
  {
    path: "/",
    Component: Home,
  },
  {
    path: "/about",
    Component: About,
  },
]);

// 라우터 내보내기
export default router;	```
 ### Link 
	``` import { Link } from "react-router-dom";
	<Link to="/about">소개</Link> ```
 ### NavLink	
 - 현재 URL과 to 속성이 일치하는지 판단 
 - end 사용
 ``` className={({ isActive }) => (isActive ? activeStyle : "")} ```
 ### Navigate
 - 즉시 다른 페이지로 이동시킬 때 사용한다(리다이렉트) ex) 로그인
 - replace 속성: 히스토리에 남기지 않아서 사용자가 뒤로가기 버튼으로 이전 페이지로 돌아갈 수 없다
 ```
 import { Navigate } from "react-router-dom";
  if (!isLoggedIn) {
    return <Navigate to="/login" replace />;
  }
  return <div>...</div>;
 ```
 ### useNavigate() 훅
 - 이벤트 핸들러 또는 useEffect 훅 내부에서 특정 로직 실행 후 페이지를 이동할 때 사용
 ```
 import { useNavigate } from "react-router-dom";
 const navigate = useNavigate();
 <button onClick={() => navigate("/about")}>소개 페이지</button>
 ```
 - 상태로 관리하는것과 쿼리 파라미터의 차이점
 useState 는 주소창에 나타나지 않고 쿼리 파라미터는 주소창에 나타난다.
 -  ?? "" : Nullish 연산자
 ``` const order = searchParams.get("order") ?? "asc";  ```