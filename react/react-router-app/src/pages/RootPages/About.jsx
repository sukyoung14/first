import React from "react";
import { NavLink } from "react-router-dom";

export default function About() {
  return (
    <div>
      <h1 className="font-bold text-4xl">소개 페이지</h1>
      {/* to 속성 : 어떤 주소로 이동할것인지? */}
      <NavLink to="/">홈</NavLink>
      <br />
      <NavLink
        to="/About"
        className={({ isActive }) => {
          return isActive ? "text-red-900 font-bold text-4xl" : "";
        }}
      >
        소개
      </NavLink>
      <br />
      <NavLink
        to="/Profile"
        className={({ isActive }) => {
          return isActive ? "text-red-900 font-bold text-4xl" : "";
        }}
      >
        프로필
      </NavLink>
    </div>
  );
}
