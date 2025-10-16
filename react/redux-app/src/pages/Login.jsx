import React from "react";
import { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { login } from "../store/authSlice";
import { useNavigate } from "react-router-dom";

export default function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const dispatch = useDispatch();
  const navigate = useNavigate();

  // token 상태는 로그인을 성공하면 값이 존재
  // 로그인을 안했다면 값이 null
  const token = useSelector((state) => {
    return state.auth.token;
  });

  useEffect(() => {
    if (token) {
      alert("로그인 상태입니다.");
      console.log(token);
      navigate("/");
    }
  }, [token]);
  function handleSubmit(e) {
    e.preventDefault(); // form의 기본 기벤트(동작) 막기
    dispatch(login({ email: email, password: password }));
  }
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
        <input type="submit" value="로그인" />
      </form>
    </div>
  );
}
