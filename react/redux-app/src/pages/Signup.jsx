import React from "react";
import { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
// singup 액션 : 회원가입 비동기 네트워크 처리 액션
// resetIsSignup 액션 : inSignup 상태 초기화(false) 액션
import { signup, resetIsSignup } from "../store/authSlice";
import { useNavigate } from "react-router-dom";
export default function Signup() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  // dispatch 함수
  const dispatch = useDispatch();
  // navigate 함수
  const navigate = useNavigate();

  // 전역 상태 isSignup 불러오기
  const isSignup = useSelector((state) => state.auth.isSignup);
  // 전역 상태 error 불러오기
  const error = useSelector((state) => state.auth.error);

  function handleSubmit(e) {
    e.preventDefault(); // form의 기본 기벤트(동작) 막기
    // 비동기 처리 액션(signup)을 디스패치(dispatch)로 실행
    dispatch(signup({ email: email, password: password }));
  }

  // 회원 가입이 성공했을때 알림창 띄우고, 홈페이지로 이동 시키는 코드, useEffect 사용
  useEffect(() => {
    if (isSignup === true) {
      alert("회원가입을 성공했습니다. 메일함을 확인해주세요");
      dispatch(resetIsSignup);
      navigate("/home");
    }
  }, [isSignup, dispatch]);

  return (
    <div>
      <form
        onSubmit={(e) => {
          handleSubmit(e);
        }}
      >
        <input
          type="email"
          value={email}
          onChange={(e) => {
            setEmail(e.target.value);
          }}
        />
        <input
          type="password"
          value={password}
          onChange={(e) => {
            setPassword(e.target.value);
          }}
        />
        <input type="submit" value="회원가입" />
      </form>
    </div>
  );
}
