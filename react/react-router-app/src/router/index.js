import { Component } from "react";
// import Home from "../pages/Home";
// import About from "../pages/About";
// import Profile from "../pages/Profile";

// React Router의 createBrowerRouter 불러오기
// 라우터 설정을 생성하는 함수
// 라우터 : 주소(URL)와 컴포넌트를 매핑
import { createBrowserRouter } from "react-router-dom";

import rootRoutes from "./routes/rootRoutes.js";
//import authRoutes from "./routes/authRoutes.js";

import NotFound from "../pages/NotFound";
//import PATHS from "../constants/paths.js";
// 라우터 설정 생성
const router = createBrowserRouter([
  // 스프레드 연산자(...)로 경로 배열을 복사
  ...rootRoutes,
  // ...authRoutes,
  {
    // 모든 주소에 매핑되는 path
    path: "*", // 별표 : 모든것에 매칭(일치)되는 특수 문자
    Component: NotFound,
  },
]);

export default router;
