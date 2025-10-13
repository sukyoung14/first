import React from "react";
import { Link } from "react-router-dom";
export default function AuthHome() {
  return (
    <div>
      인증 홈페이지
      <div className="flex flex-col gpa-4">
        <Link to="/auth/login">로그인</Link>
        <Link to="/auth/signup">회원가입</Link>
      </div>
    </div>
  );
}
