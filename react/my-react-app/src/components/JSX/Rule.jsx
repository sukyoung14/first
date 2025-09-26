import React from "react";
// export default : 모듈 기본 내보내기
// return : 요소(Element) - 태그 를 반환
// 파일 당 하나 존재하는 함수는 컴포넌트를 뜻하는데
export default function Rule() {
  // DOM API
  // const element = document.createElement("h1");
  // element["textContext"] = "App";
  // 규칙 1. 1개의 태그만 반환해야 한다
  // DIV 태그 3개 반환
  // return (<div>1</div><div>2</div><div>3</div>); // --> 오류
  // div 태그 3개를 감싸는 1개의 Freament 태그 <> </> 를 반환 -- 최상위 태그가 1개밖에 없다
  return (
    <>
      <div>1</div>
      <div>2</div>
      <div>3</div>

      {/* 규칙 2. 모든 태그는 닫아야 한다. */}
      <imput></imput>
      <imput />

      {/* 규칙 3. 속성명(class, onclick, onsubmit) 을 카멜케이스(camelCase)로 작성한다 */}
      {/* 카멜 케이스 : 첫단어는 소문자, 이후 단어의 시작 글자를 대문자 */}
      {/* onclick → onClick, onsubmit → onSubmit  */}
      {/* class -→ className */}
      <p className="font-bold text-5xl text-red-700">P 태그{1 + 0}</p>

      {/* 규칙 4. style 속성의 값은 객체로 작성한다*/}
      <p style={{ fontSize: "3rem", color: "blue" }}> P 태그2 + 0</p>
    </>
  );
}
