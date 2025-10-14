import { Component } from "react";
// import Home from "../pages/Home";
// import About from "../pages/About";
// import Profile from "../pages/Profile";

// React Router의 createBrowerRouter 불러오기
// 라우터 설정을 생성하는 함수
// 라우터 : 주소(URL)와 컴포넌트를 매핑
import { createBrowserRouter } from "react-router-dom";

// 레이아웃 컴포넌트 불러오기
import RootLayout from "../layout/RootLayout";
import AuthLayout from "../layout/AuthLayout";
import ProtectedLayout from "../layout/ProtectedLayout";

import Home from "../pages/RootPages/Home";
import About from "../pages/RootPages/About";
import Profile from "../pages/RootPages/Profile";
import PostList from "../pages/RootPages/PostList";
import PostDetail from "../pages/RootPages/PostDetail";

import AuthHome from "../pages/AuthPages/AuthHome";
import Signup from "../pages/AuthPages/Signup";
import Login from "../pages/AuthPages/Login";

import PATHS from "../constants/paths.js";
// 라우터 설정 생성
const router = createBrowserRouter([
  {
    path: PATHS["ROOT"]["INDEX"],
    Component: RootLayout,
    children: [
      //중첩할 자식 경로 객체를 정의하는 배열
      {
        index: true, //index : true -> 부모경로의 기본(root) 경로
        // 완성되는 path : "/" (부모 경로와 동일)
        Component: Home,
      },
      {
        path: PATHS.ROOT.ABOUT,
        Component: About,
      },
      {
        path: PATHS.ROOT.POSTS,
        Component: PostList,
      },
      {
        path: PATHS.ROOT.POST_DETAIL,
        Component: PostDetail,
      },
      {
        // path 속성 X
        Component: ProtectedLayout,
        // 보호할 경로와 컴포넌트 정의
        children: [
          {
            path: PATHS.ROOT.PROFILE,
            Component: Profile,
          },
        ],
      },
    ],
  },
  {
    path: PATHS.AUTH.INDEX,
    Component: AuthLayout,
    children: [
      {
        index: true,
        Component: AuthHome,
      },
      {
        path: PATHS.AUTH.SIGNUP,
        Component: Signup,
      },
      // 부모 경로 : /auth (절대 경로 표현)
      // 자식 경로 : login (상대 경로 표현)
      // 완성 경로 : /auth/login
      {
        path: PATHS.AUTH.LOGIN,
        Component: Login,
      },
    ],
  },
]);

export default router;
