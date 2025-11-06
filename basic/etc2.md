# 공통

- 길이 : length <!--변수명.length-->
- 형변환 : Number("1") <!--숫자형-->
- 카멜케이스 : 속성명의 첫 글자를 소문자로 작성하고, 나머지 단어의 첫 글자를 대문자로 작성하는 방법

# GIT

    - 윈도우 > 터미널에서 열기 : windows powershell로 열림
    - 터미널에서 git bash를 기본값으로 하는 법 : https://velog.io/@alsry922/Windows-Terminal%EC%97%90-git-bash-%EC%B6%94%EA%B0%80%ED%95%98%EA%B8%B0
    ``` 가져오기
    - git init
    - git remote add origin https://github.com/SESAC-SD3/SQL.git
    - git pull origin main		```

# HTML

- <input> 태그의 placeholder 속성 : 사용자가 아무것도 입력하지 않았을 때 임시로 나타나는 회색 글씨
- <input> 태그의 required 속성 : 필수입력
- HTML 요소를 구성하는 태그, 속성, 컨텐츠
  1.  태그 : 요소의 기능을 나타내고 시작 태그 <>와 종료 태그 </>로 구성된다
  2.  속성 : 요소의 추가 특성을 나타내고, 시작 태그 내부에 작성한다.
  3.  내용 : 화면에 표시할 텍스트 또는 또 다른 요소를 작성한다.

````onChange={(e) => {
         setPayload(e.target.value);
       }}```
# CSS

- font-weight : b태그 - 굵기 지정
- vw (뷰포트 너비) vh (뷰포트 높이)
- em -
- rem - 기본값: 16px 사용자가 지정한 폰트
- margin: 외부 여백
- padding: 내부 여백

# Tailwind CSS
``` @import "tailwindcss";```
- cursor-pointer - 손모양
# 자바스크립트
- 터미널에서 실행 : node 파일명
- 구조 분해 할당 : 배열이나 객체의 값을 쉽게 추출해서 변수에 할당
- JSON.stringify() : JavaScript 객체를 JSON 문자열로 변환
``` const person = { name: "홍길동", age: 30, job: "개발자" };
const jsonString = JSON.stringify(person);	```
- JSON.parse() : JSON 문자열을 JavaScript 객체로 변환
``` const jsonString = '{"name":"홍길동","age":30,"job":"개발자"}';
const person = JSON.parse(jsonString);	```

##  axios 실행
npm install axios
- package.json 추가 작성
{
 "type": "module"
}
````

    import axios from "axios";
    const BASE_URL = `https://dummyjson.com`;
    async function getProducts() {
    const response = await axios.get(`${BASE_URL}/products`);
      const data = response["data"];
      console.log(data);
    }

getProducts();

````

# 리액트

 ##  JSX 보간법 : {}

 ##  명명 규칙 : handle

 ##  컴포넌트 : import MyList from "./components/Component/MyList"; MyList명은 대문자로 시작해야 한다.
- ```event 함수에서 value 값
  const elements = event["target"]["elements"];
   const { email, password, name } = elements;
  console.log(`이름 입력 값: ${name["value"]}`);
````

`` console.log(`이름 입력 값: ${event["target"]["value"]}`);  ``

-     event.preventDefault(); - onSubmit에서 멈추는 , 막기

## Props

- 함수 전달: onClick={handleClick} 소괄호 없음
- 함수 호출: onClick={() => onClick()} 소괄호 있음

## useState, useEffect

```
	import { useEffect, useState } from "react";
	  const [data, setData] = useState([]);
	useEffect(() => {}, []); //빈 의존성 배열 : 컴포넌트가 첫 랜더링될때만 콜백함수가 실행
```

## map

```
	{products.map((product) => {
        // 매개변수 product를 Product 컴포넌트에 Props로 전달
        // 속성명 : product / 값 : 매개변수 product를
        return <Product key={product.id} product={product}></Product>;
      })}
```

## TMDB

    - /src/.env : config 파일(환경변수) - 변수명에 VITE_를 꼭 써야 함
    - /src/.env.example : 환경변수 정리파일
    - VITE_TMDB_API_KEY=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZTI5NzE3MjY4NjMzYjE4YmVlZTk3Yzg3YzBjMDQ1NSIsIm5iZiI6MTU2ODg3Njk5MS4wMSwic3ViIjoiNWQ4MzI5YmYxNjJiYzMwMjI3ZGRmY2Q2Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.K4Rfgg3rBpZHzkWitF3lASxkW7LXnd2nZFDkzmb3e5c

    // 환경 변수 사용

`const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL;`

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
- export default axiosInstance; // 한개만 내보내기
- export { axiosInstance, axiosInstance2 }; // 여러개 내보내기
- export는 함수 앞에 써도 됨

````export async function getPopularMovies() {}
import { getPopularMovies } from "./../../api/tmdb";```
## 라우터(React Router)
### React Router 설치
- react router 버전 7 설치
``` npm install react-router-dom@^7 ```
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
- RouterProvider 컴포넌트 적용
- src/main.jsx 파일에
````

import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { RouterProvider } from "react-router-dom";
import router from "./router";
import "./index.css";

createRoot(document.getElementById("root")).render(
<StrictMode>
<RouterProvider router={router} />
</StrictMode>
);

````

 ### Link
	``` import { Link } from "react-router-dom";
	<Link to="/about">소개</Link> ```
 ### NavLink
 - 현재 URL과 to 속성이 일치하는지 판단
 - end 사용 : home 이상일때
 ``` className={({ isActive }) => (isActive ? activeStyle : baseClass)}
 <NavLink
          className={({ isActive }) => (isActive ? activeStyle : baseClass)}
          to="/login"
          end
        > ```
 ### Navigate
 - 즉시 다른 페이지로 이동시킬 때 사용한다(리다이렉트) ex) 로그인
 - replace 속성: 히스토리에 남기지 않아서 사용자가 뒤로가기 버튼으로 이전 페이지로 돌아갈 수 없다
````

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

````
- 상태로 관리하는것과 쿼리 파라미터의 차이점
useState 는 주소창에 나타나지 않고 쿼리 파라미터는 주소창에 나타난다.
-  ?? "" : Nullish 연산자
``` const order = searchParams.get("order") ?? "asc";  ```

### Outlet - 경로 안에 경로를 중첩하는 방식으로, 공통 레이아웃을 유지하면서 페이지의 일부 영역은 자식 컴포넌트를 배치
``` import { Outlet } from "react-router-dom";
<Outlet></Outlet> ```
### createBrowserRouter() 함수의 children 속성
- 부모 경로에 중첩할 자식 경로를 설정한다
- 자식 경로의 컴포넌트는 부모 경로의 <Outlet> 컴포넌트 위치에 배치
### 경로 파라미터(Path Parameters)
	- :{paramName}: 파라미터 키(key)
	```
	path: "/posts/:postId", //  파라미터 :postId, 동적으로 처리되는 변수
	```
	- 추출 ```
	import { useParams } from "react-router-dom";
	const { postId } = useParams(); ```
### 쿼리 파라미터(Query Parameters)
- useSearchParams() 훅
``` import { useSearchParams } from "react-router-dom";

// [쿼리 파라미터, 쿼리 파라미터 변경 함수]
const [searchParams, setSearchParams] = useSearchParams(); ```
- 쿼리 파라미터 값 읽기
	``` const sortBy = searchParams.get("sortBy"); ```
- 쿼리 파라미터 값 변경
	``` setSearchParams({ sortBy: "id", order: "asc" }); ```
### 초기화, 이전페이지, 다음페이지
````

     onClick={() => { setSearchParams({});}}		// 초기화
     onClick={() => {			//이전페이지
            if (Number(skip) - 5 >= 0) {
              setSearchParams({
                skip: Number(skip) - 5,
                order,
                sortBy,
              });
            }
          }}

    onClick={() => {
            if (Number(skip) + 5 <= total) {
              setSearchParams((searchParams) => {
                searchParams.set("skip", Number(skip) + 5);
                return searchParams;
              });
            }
          }}

`````
 ## Redux
 ### Redux Toolkit
- https://redux-toolkit.js.org/
### redux, redux-toolkit 설치
npm install react-redux
npm install @reduxjs/toolkit
 ## JavaScript JWT 디코더
	```  npm install jwt-decode  ```
	- jwt-decode 라이브러리 사용
	```  import { decode } from "jwt-decode";
const token = "...";

const decoded = decode(token);
console.log(decoded);	```
ysk8104@naver.com / 12341234
###  Redux Persist - Redux의 전역 상태를 브라우저의 로컬 스토리지(Local Storage)에 저장하고, 새로고침 후에도 전역 상태를 복원하는 도구
``` npm install redux-persist ```


### 마크 다운 표현으로 해줌
   ``` npm install react-markdown remark-gfm	```
	/chat-bot-app/src/index.css에 /* 마크다운 스타일링 */
```` import ReactMarkdown from "react-markdown";
<ReactMarkdown remarkPlugins={[remarkGfm]}>
           {message.content}
         </ReactMarkdown> ```
 // useRef  훅 : document.querySelector() -> 요소를 선택
 // const element = document.querySelector("div");
 ### 노드 선택
`````

element.getAttribute("속성명"); // 속성 값 읽기
element.setAttribute("속성명", "새로운 값"); // 속성 값 조작
element.속성명 = "새로운 값"; // 속성 값 조작
element.classList.add("클래스명"); // 클래스 추가
element.classList.remove("클래스명"); // 클래스 제거
element.classList.toggle("클래스명"); // 클래스 토글 (있으면 제거, 없으면 추가)
element.classList.contains("클래스명"); // 클래스 포함 여부 확인```// 응답 메시지가 추가되면 최하단으로 스크롤` messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });`

### axios로 DB 저장

````import { useState, useEffect, useCallback } from "react";
import axios from "axios";

const BASE_URL = import.meta.env.VITE_SUPABASE_MEMO_URL;
const [memos, setMemos] = useState([]);
const getMemo = useCallback( async (userId, filterFlag = null) => {
    if (!userId) return;
    try {
      const url = `${BASE_URL}/rest/v1/tb_memo`;
      const params = {
        select: "*",
        order: "created_at.desc",
      };

      if (filterFlag !== null) {
        params.flag = `eq.${filterFlag}`;
      }

      const config = {
        method: "GET",
        url: url,
        headers: {
          apikey: ANON_KEY,
          "Content-Type": "application/json",
        },
        params: params,
      };

      const response = await axios(config);
      const data = response.data;
      console.log(data);
      setMemos(data);
    } catch (err) {
      alert("메모 목록을 불러오는데 실패했습니다.");
    }
  },
  [token]
);
const handleMemoUpdated = useCallback(() => {
  if (currentUserId) {
    getMemo(currentUserId, null);
  }
}, [currentUserId, getMemo, activeFilter]);
const handleMemoUpdated = useCallback(() => {
  if (currentUserId) {
    setActiveFilter(null);
    getMemo(currentUserId, null);
  }
}, [currentUserId, getMemo, activeFilter]); ```
---------------------------------- ---------------------------------- ---------------------------------- ---------------------------------- ----------------------------------
``` {flagMemos.length === 0 ? (
      <p>메모가 없습니다.</p>
    ) : (
      flagMemos.map((memo) => {
        return (
          <MemoList
            key={memo.id}
            memo={memo}
            onDelete={handleDeleteMemo}
            onMemoUpdated={handleMemoUpdated}
          />
        );
      })
    )} ```
---------------------------------- ---------------------------------- ---------------------------------- ---------------------------------- ----------------------------------
``` export default function MemoList({ memo, onDelete, onMemoUpdated }) {}
function handelClick() {
  if (confirm(`${memo.flag ? "미완료" : "완료"}로 변경하시겠습니까?`)) {
    postMemo(memo.flag ? false : true);
  }
}
async function postMemo(memoFlag) {
  try {
    const url = `${BASE_URL}/rest/v1/tb_memo?id=eq.${memo.id}`;
    const config = {
      method: "PATCH",
      url: url,
      headers: {
        apikey: ANON_KEY,
        "Content-Type": "application/json",
      },
      data: {
        id: memo.id,
        flag: memoFlag,
      },
    };
    const response = await axios(config);
    const data = response.data;
    setflag(memo.flag ? false : true);
    if (onMemoUpdated) {
      onMemoUpdated();
    }
  } catch (err) {
    alert("변경에 실패했습니다.");
  }
}
async function DelMemo() {
  try {
    const url = `${BASE_URL}/rest/v1/tb_memo?id=eq.${memo.id}`;
    const config = {
      method: "DELETE",
      url: url,
      headers: {
        apikey: ANON_KEY,
        "Content-Type": "application/json",
      },
      data: {
        id: memo.id,
      },
    };
    const response = await axios(config);
    const data = response.data;
    console.log("Memo Delete successfully.");
    if (onDelete) {
      onDelete(memo.id); // 부모 컴포넌트에 삭제된 메모의 ID 전달
    }
  } catch (err) {
    alert("메모 삭제가 실패했습니다.");
  }
} ```
---------------------------------- ---------------------------------- ---------------------------------- ---------------------------------- ----------------------------------
## Redux - 전역 상태 관리
### 스토어(store) - 리듀서(Reducer)를 받아서 전역 상태를 관리하는 중앙 저장소

### dispatch - 컴포넌트에서 액션 생성자 함수를 실행하고, 그 결과인 액션을 스토어(store)에 전달(dispatch)하는 함수
``` import { useDispatch } from "react-redux";
import { 액션_생성자_함수 } from "...";
const dispatch = useDispatch();
<button onClick={() => dispatch(액션_생성자_함수())}>상태 변경</button>  ```
### Slice (슬라이스) - 리듀서(Reducer)와 액션(Action)을 한 번에 생성하는 함수
- src/store/counterSlice.js
``` import { createSlice } from "@reduxjs/toolkit";
const initialState = { count: 0, };
const counterSlice = createSlice({
name: "counter",
initialState,
reducers: {
  increment: (state) => {
    state.count += 1;
  },
  incrementByAmount: (state, action) => {
    state.count += Number(action.payload);
  },
  reset: (state) => {
    state.count = 0;
  },
},
});
export const { increment, incrementByAmount, reset } = counterSlice.actions;

export default counterSlice.reducer;
````

- src/store/index.js

````import { configureStore } from "@reduxjs/toolkit";
	import CounterSlice from "./counterSlice";

	export const store = configureStore({
reducer: {
 // 리듀서 설정
 counter: counterReducer,
},
});

	// 스토어 내보내기
	export store;   ```

### Provider - Redux 스토어를 애플리케이션 전체에 적용하기 위한 컴포넌트
 ``` import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { Provider } from "react-redux";
import { store } from "./store";
import App from "./App.jsx";
import "./index.css";

createRoot(document.getElementById("root")).render(
<StrictMode>
 <Provider store={store}>
   <App />
 </Provider>
</StrictMode>
);   ```
### useSelector - 스토어(store)에서 상태를 가져오는 훅
``` import { useSelector } from "react-redux";
const state = useSelector((state) => state.상태);  ```
---------------------------------- ---------------------------------- ---------------------------------- ---------------------------------- ----------------------------------
# Java
- int million = 1_000_000;     // 언더스코어로 가독성 향상 (Java 7+)
- float f = 3.14f;      // f 또는 F 접미사 필수
- // 특수 문자
	char newLine = '\n';     // 줄바꿈
	char tab = '\t';         // 탭
	char backslash = '\\';   // 백슬래시
	char quote = '\'';       // 작은따옴표
- double dB = 3.14;
int iB = (int) dB;     // 강제 형변환
- str1.equals(str2) //     문자열 비교
- && 연산: 첫 번째가 false면 두 번째 평가 안 함
- || 연산: 첫 번째가 true면 두 번째 평가 안 함
- 삼항연산자 : 조건식 ? 참일_때_값 : 거짓일_때_값
- switch문
	``` String season = switch (month){
         case 3,4,5 -> "봄";
         case 6,7,8 -> "여름";
         default -> "잘못된 월";
     }; ```
- for문 - index 접근
````	for (int i = 0; i < 10; i++) { }
		for (int i = 10; i >= 1; i--) { }
		for  (int i = 0; i < 10; i+=2) { }
		for (int i = 0, j = 10;  i < j; i++, j--) { }		````
- enhanced for(향상된 for문) - 요소 반복
````		int[] numbers = {10, 20, 30, 40, 50};
		 for (int num : numbers) {
					System.out.println(num);
				}		````
- // do-while : 조건을 나중에 검사하므로 최소 1회는 실행됩니다.
// 각 문자에서 '0'의 아스키 값을 빼면 실제 숫자 값이 됨
    sum += strNum.charAt(i) - '0';
- 배열		``` int[] nums = {5, 2, 1, 7, 8}; ```
	1. toString() - 배열을 문자열로		``` Arrays.toString(numbers) ```
	2. sort() - 정렬  ``` Arrays.sort(numbers); ```
	3. binarySearch() - 이진 탐색 (정렬된 배열에서) 위치 찾기 	``` Arrays.binarySearch(numbers, 5); ```
	4. equals() - 배열 비교		```	Arrays.equals(arr1, arr2) ```
	5. deepToString() - 다차원 배열 출력
		``` int[][] matrix = {{1, 2}, {3, 4}};
        System.out.println("2차원 배열: " + Arrays.deepToString(matrix)); ```
- 2차원 배열
        ``` int[][] matrix = {  {1, 2, 3}, {4, 5, 6}  };
		for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                sum += matrix[i][j];
            }
        }	``` 
- 가변인자
``` int add (int a, int b) { return a + b; } ``` 
``` int add (int... numbers){        return sum; } ``` 
	// 컴파일 에러! 가변 인자 뒤에 다른 매개변수 불가, 가변 인자는 하나만
    // void method2(int... scores, String name) { }
