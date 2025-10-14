// RootLayout과 RootLayout에 중첩된 페이지 경로 배열을 정의

import RootLayout from "../../layout/RootLayout";
import Home from "../../pages/RootPages/Home";
import About from "../../pages/RootPages/About";
import Profile from "../../pages/RootPages/Profile";
import PostList from "../../pages/RootPages/PostList";
import PostDetail from "../../pages/RootPages/PostDetail";
// 레이아웃 컴포넌트 불러오기
//import ProtectedLayout from "../layout/ProtectedLayout";
// 경로 상수 불러오기
import PATHS from "../../constants/paths.js";

// Rootlayout의 경로 배열을 작성
const rootRoutes = [
  {path: PATHS.ROOT.INDEX,
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
      path: PATHS.ROOT.PROFILE,
      Component: Profile,
    },
    // {
    //   // path 속성 X
    //   Component: ProtectedLayout,
    //   // 보호할 경로와 컴포넌트 정의
    //   children: [
    //     {
    //       path: PATHS.ROOT.PROFILE,
    //       Component: Profile,
    //     },
    //   ],
    // },
  ]}
]

export default rootRoutes;
