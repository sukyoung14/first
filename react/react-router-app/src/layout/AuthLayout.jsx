import React from "react";
import { NavLink } from "react-router-dom";
import { Outlet } from "react-router-dom";
import PATHS from "../constants/paths";

export default function AuthLayout() {
  const baseClass = "border-2 border-amber-300 p-2";
  // 활성화 class
  const activeClass = "border-2 border-red-900";
  return (
    <div>
      <div className="flex gap-2">
        {/* JSX 보간법 + 템플릿 리터럴 + 화살표 함수 + 삼항연산자 혼합 */}
        {/* 삼항연산자 는 표현식이라서 템플릿 리터럴이 적용 가능하다 */}
        <NavLink
          className={({ isActive }) =>
            `${baseClass} ${isActive ? activeClass : ""} `
          }
          to={PATHS.AUTH.INDEX}
          end
        >
          인증 페이지
        </NavLink>
        <NavLink
          className={({ isActive }) =>
            `${baseClass} ${isActive ? activeClass : ""} `
          }
          to={PATHS.AUTH.LOGIN}
        >
          로그인 페이지
        </NavLink>
        <NavLink
          className={({ isActive }) =>
            `${baseClass} ${isActive ? activeClass : ""} `
          }
          to={PATHS.AUTH.SIGNUP}
        >
          회원가입 페이지
        </NavLink>
        <NavLink
          className={({ isActive }) =>
            `${baseClass} ${isActive ? activeClass : ""} `
          }
          to="/"
        >
          홈페이지
        </NavLink>
      </div>
      <Outlet></Outlet>
    </div>
  );
}
