import React from "react";
import { Link } from "react-router-dom";
import PATHS from "../constants/paths";

export default function NotFound() {
  return (
    <div>
      <div className=" p-2">페이지를 찾을수 없습니다. 404 Error</div>
      <div>
        <Link className="border-2 p-2" to="/">
          홈페이지로 돌아가기
        </Link>
      </div>
    </div>
  );
}
