import React from "react";
// counter 전역 상태 count의 값을 1 증가 시키는 버튼 컴포넌트
// Increment(상태 count + 1) 액션 생성자 함수 -> 액션을 생성한다
import { increment } from "../store/counterSlice";
// useDispatch 생성하는 훅 - 액션(상태 변경 요청서)를 스토어로 보내는 함수
import { useDispatch } from "react-redux";

export default function CounterIncrement() {
  const dispatch = useDispatch();

  function clickHandler() {
    // dispatch 함수의 인자로 액션 생성자 함수를 전달
    // 액션 생성자 함수(increment)가 생성한 액션을 dispatch 함수로 스토어의 리듀서에 전달
    dispatch(increment());
    // const action = increment();
    // console.log(action);
  }
  return (
    <div>
      <button
        onClick={() => {
          clickHandler();
        }}
      >
        1 증가
      </button>
    </div>
  );
}
