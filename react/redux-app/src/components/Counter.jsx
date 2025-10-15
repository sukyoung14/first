import React from "react";
import { useEffect } from "react";
import { useSelector } from "react-redux";
export default function Counter() {
  // count 전역 상태 불러오기
  const counter = useSelector((state) => state.counter);
  // 전역상태 counter
  const count = useSelector((state) => state["counter"]["count"]);
  // useEffect(() => {
  //   console.log(counter);
  // });
  return <div>전역 상태 count 값 {count}</div>;
}
