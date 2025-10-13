import React from "react";
import { Navigate } from "react-router-dom";
import { useNavigate } from "react-router-dom";
export default function Profile() {
  const isLogin = true;

  // 로그인 상태가 아니면 "/" 주소로 리다이렉트
  if (isLogin === false) {
    // Navigate는 컴포넌트라서 return 내부에 있어야 한다.
    // replace 속성 : history(사용자가 페이지를 이동한 내역)에 쌓이지 않는다. - 뒤로가기가 안됨
    return <Navigate to="/"></Navigate>;
  }

  const navigate = useNavigate();
  return (
    <div>
      사용자 정보
      <br />
      <button
        className="border p-2"
        onClick={() => {
          alert("홈페이지 이동");
          //페이지 이동 전 특정 로직을 수행할때 사용
          navigate("/");
        }}
      >
        홈페이지로 이동
      </button>
    </div>
  );
}
