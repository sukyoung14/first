import React from "react";
import Interpolation from "./components/JSX/Interpolation";
import Header from "./components/Header";
import Footer from "./components/Footer";

import MyButton from "./components/Component/MyButton";
import MyList from "./components/Component/MyList";

import OnClick from "./components/Component/EventHandling/OnClick";
import OnChange from "./components/Component/EventHandling/OnChange";
import OnSubmit from "./components/Component/EventHandling/OnSubmit";
// 파일명과 동일한 함수는 컴포넌트 함수
// 컴포넌트 함수는 파일당 하나만 존재
// 컴포넌트 함수 외부는 import 문만 사용
export default function App() {
  // 영역 1. 내부 기능로직을 작성하는 영역
  // - 이벤트 핸들러 함수를 정의
  // 영역 2. 태그 (HTML 문서)를 생성하는 영역
  return (
    <div>
      <OnClick></OnClick>
      {/* <OnChange></OnChange> */}
      {/* <OnSubmit></OnSubmit> */}
      {/* <Header></Header> */}
      {/* <Interpolation></Interpolation> */}
      {/* <MyList /> */}
      {/* <MyButton /> */}
      {/* <Footer></Footer> */}
    </div>
  );
}
