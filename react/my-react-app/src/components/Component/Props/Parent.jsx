import React from "react";
import Child from "./Child";
export default function Parent() {
  return (
    <div>
      {/* 데이터(Props, 자식 컴포넌트의 속성)를 전달하는 방법 */}
      {/* Child 컴포넌트의 name 속성과 age속성  */}
      {/* 문자열 속성은 따옴표 사이에 넣고 숫자 속성은 중괄호 사이에 넣는다 */}
      <Child name="홍길동" age={20} />
      <Child name="김철수" age={25} />
      <Child name="영희" age={30} />
    </div>
  );
}
