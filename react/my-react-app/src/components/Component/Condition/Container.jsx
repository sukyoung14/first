import React from "react";
import AdminLink from "./AdminLink";
export default function Container() {
  return (
    <div>
      {/* 첫번째 컴포넌트에는 isLogin 속성에 true 전달*/}
      {/* <LoginStatus isLogin={true} userName={"홍길동"} /> */}
      {/* 첫번째 컴포넌트에는 isLogin 속성에 false 전달*/}
      {/* <LoginStatus isLogin={false} userName={"김철수"} /> */}
      <AdminLink isAdmin={true}></AdminLink>
      <AdminLink isAdmin={false}></AdminLink>
    </div>
  );
}
