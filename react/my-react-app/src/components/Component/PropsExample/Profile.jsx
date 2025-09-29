import React from "react";

export default function Profile({ user }) {
  return (
    <div>
      저는 {user.name} 이고, {user.age}세 이며, 관리자 여부는 {user.isAdmin}
      입니다.
    </div>
  );
}
