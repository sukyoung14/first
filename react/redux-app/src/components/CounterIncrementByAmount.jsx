import React from "react";
// 사용자에게 값을 입력받고, 입력 값만큼 전역 상태 count 더하기
import { useState } from "react";
import { useDispatch } from "react-redux";
// 액션 생성자 함수
import { incrementByAmount } from "../store/counterSlice";

export default function CounterIncrementByAmount() {
  // 지역상태 payload - 사용자 입력값 관리
  const [payload, setPayload] = useState(0);
  const dispatch = useDispatch();
  return (
    <div>
      <input
        type="number"
        value={payload}
        onChange={(e) => {
          setPayload(e.target.value);
        }}
      />
      <button
        onClick={() => {
          // 액션 생성자 함수의 인자 === payload(상태를 얼마나 변경할지 결정하는 값)
          dispatch(incrementByAmount(payload));
        }}
      >
        증가
      </button>
    </div>
  );
}
