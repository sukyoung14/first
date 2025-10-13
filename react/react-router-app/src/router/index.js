import Home from "../pages/Home";
import About from "../pages/About";
import Profile from "../pages/Profile";

// React Router의 createBrowerRouter 불러오기
// 라우터 설정을 생성하는 함수
// 라우터 : 주소(URL)와 컴포넌트를 매핑
import { createBrowserRouter } from "react-router-dom";
import { Component } from "react";

// 라우터 설정 생성
const router = createBrowserRouter([
  {
    path: "/", //주소(URL)
    Component: Home, // 주소에 해당되는 컴포넌트
  },
  {
    path: "/about",
    Component: About,
    //element: <About />, // Component 속성과 동일한 기능을 하지만 컴포넌트 이름이 아니라 컴포넌트 태크를 설정
    // element 보다 Component를 사용하는게 더 효율적임
  },
  {
    path: "/profile",
    Component: Profile,
  },
]);

export default router;
