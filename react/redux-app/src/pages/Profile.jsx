import React from "react";

// 로그아웃 버튼
// 만약에 로그인을 한 상태라면 사용자 정보를 출력
// 정상적으로 로그인을 했을 때 사용자 정보는 전역 상태 token에 저장된 상황
import { useSelector } from "react-redux";
import { jwtDecode } from "jwt-decode";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

// 액션을 실행하기 위한 액션 생성자 함수와 useDispatch 훅
import { logout } from "../store/authSlice";
import { useDispatch } from "react-redux";
export default function Profile() {
  const token = useSelector((state) => state.auth.token);
  console.log("Profile : ", token);
  const [decodeToken, setDecodeToken] = useState(null);
  const navigate = useNavigate();
  const dispatch = useDispatch();
  useEffect(() => {
    if (token) setDecodeToken(jwtDecode(token));
    //else navigate("/login");
  }, [token]);
  //console.log(decodeToken);
  function handleLogout() {
    // dispatch 함수로 logout 액션을 스토어(store) 전달
    dispatch(logout());
  }
  return (
    <div>
      <div>{token ? token : "로그인을 해주세요"}</div>
      <div>
        {decodeToken ? `이메일 : ${decodeToken.email}` : "로그인을 해주세요"}
      </div>
      <div>
        <button
          className="border-2"
          onClick={() => {
            handleLogout();
          }}
        >
          로그아웃
        </button>
      </div>
    </div>
  );
}
