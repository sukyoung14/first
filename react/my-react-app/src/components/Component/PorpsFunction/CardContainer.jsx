import React from "react";
import Card from "./Card";
export default function CardContainer() {
  function handleClick(user) {
    console.log(user);
    alert(`이름은 ${user.name}이고, 나이는 ${user.age}`);
  }
  const user = {
    name: "홍길동",
    age: 20,
  };
  return (
    <div>
      {/* Card 컴포넌트에 user 데이터 전달 */}
      {/* Card 컴포넌트에  handleClick 함수 전달 */}
      {/* 함수 전달할 때는 함수 이름만 전달 */}
      <Card user={user} onClickProps={handleClick}></Card>
    </div>
  );
}
