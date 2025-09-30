import React from "react";

import ArrayState from "./components/State/ArrayState";
// 파일명과 동일한 함수는 컴포넌트 함수
// 컴포넌트 함수는 파일당 하나만 존재
// 컴포넌트 함수 외부는 import 문만 사용
export default function App() {
  // 영역 1. 내부 기능로직을 작성하는 영역
  // - 이벤트 핸들러 함수를 정의
  // 영역 2. 태그 (HTML 문서)를 생성하는 영역
  // 컴포넌트명는 항상 대문자로 시작해야 함 - 대문자가 아니면 컴포넌트로 인식 못함
  return (
    <div>
      <ArrayState></ArrayState>
    </div>
  );
}
