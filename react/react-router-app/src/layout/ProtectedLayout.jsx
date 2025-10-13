import React from "react";
// 비 로그인 사용자는 로그인 페이지로 리다이렉트
import { Outlet } from "react-router-dom";
import { Navigate } from "react-router-dom";
export default function ProtectedLayout() {
  const isLogin = false;
  // 로그인 상태가 false 라면 Navigate 컴포넌트로 "/auth/login" 리다이렉트
  if (isLogin === false) return <Navigate to="/auth/login"></Navigate>;
  return <Outlet />;
}
