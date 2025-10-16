// configureStore : 리듀서를 받아서 스토어를 생성하는 함수
import { configureStore } from "@reduxjs/toolkit";
// 리듀서 불러오기
import counterReducer from "./counterSlice";

// 인증 리듀서 불러오기
import authReducer from "./authSlice";
// 스토어 생성
export const store = configureStore({
  reducer: {
    // state.counter.count 의 "counter"는 아래 리듀서의 속성명(key) === 상태명
    counter: counterReducer, // counter의 속성명을 여기서 결정
    auth: authReducer,
  },
});
