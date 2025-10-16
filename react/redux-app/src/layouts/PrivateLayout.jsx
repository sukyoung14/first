import React from "react";
// 로그인 사용자만 접근 가능한 레이아웃
import { Navigate } from "react-router-dom";
import { useSelector } from "react-redux";
import { Outlet } from "react-router-dom";

export default function PrivateLayout() {
  // 전역 상태 토큰 불러오기
  const token = useSelector((state) => state.auth.token);
  console.log("PrivateLayout : ", token);
  // 로그인 전이면 로그인으로 이동 아니면
  if (!token) return <Navigate to="/login" replace></Navigate>;
  else return <Outlet></Outlet>; // 중첩된 자식 컴포넌트 랜더링
}
