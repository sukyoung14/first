// 액세스 토큰 상태 관리
// 로그인, 회원가입, 로그아웃 같은 네트워크 비동기 처리
import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";
import Signup from "../pages/Signup";

// 환경 변수 처리
const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY;
// 회원가입 비동기 처리
const signup = createAsyncThunk(
  "auth/signup",
  //비동기 처리 함수 (async)
  async (data, { rejectWithValue }) => {
    // 매개변수 data : 액션의 페이로드 역할
    // 실제로 data 변수에 저장될 데이터 => 회원가입을 위해 필요한 데이터
    try {
      const config = {
        url: `${SUPABASE_URL}/auth/v1/signup`,
        method: "POST",
        headers: {
          "Content-type": "application/json",
          apikey: SUPABASE_ANON_KEY,
        },
        data: {
          // supabase 기준
          // 회원가입을 위해 필요한 데이터(email, password)
          email: data["email"],
          password: data["password"],
        },
      };
      const response = await axios(config);
      // 비동기 처리를 성공 했을 때의 데이터
      return response["data"];
    } catch (error) {
      // 비동기 처리를 실패 했을 때의 데이터
      return rejectWithValue(error["response"]["data"]);
    }
  }
);

// 로그인 비동기 처리 액션
const login = createAsyncThunk(
  "auth/login", // 이름
  // 비동기(async) 처리 함수
  async (data, { rejectWithValue }) => {
    // 로그인 로직 코드
    try {
      const config = {
        url: `${SUPABASE_URL}/auth/v1/token?grant_type=password`,
        method: "POST",
        headers: {
          "Content-type": "application/json",
          apikey: SUPABASE_ANON_KEY,
        },
        data: {
          // 로그인 정보
          email: data.email,
          password: data.password,
        },
      };
      const response = await axios(config);
      return response.data;
    } catch (error) {
      console.log(error.response.data);
      return rejectWithValue(error.response.data);
    }
  }
);

// 로그아웃 비동기 처리
const logout = createAsyncThunk(
  "auth/logout",
  async (_, { rejectWithValue, getState }) => {
    try {
      // axios 요청 설정(config)
      const config = {
        url: `${SUPABASE_URL}/auth/v1/logout`,
        method: "POST",
        headers: {
          "Content-type": "application/json",
          apikey: SUPABASE_ANON_KEY,
          // 사용자 인증 정보(토큰)를 함께 전송
          // 로그아웃 : 누가 로그아웃을 하는지에 대한 정보(토큰)가 필요
          Authorization: `Bearer ${getState().auth.token}`,
        },
      };
      const response = await axios(config);
      return response.data;
    } catch (error) {
      console.error(error); // (임시) 디버깅용 코드
      return rejectWithValue(error["response"]["data"]);
    }
  }
);

// 초기 상태
const initialState = {
  token: null, // 액세스 토큰 관리 상태
  error: null, // 에러 여부 관리 상태
  inSignup: false, // 회원가입 성공 여부 관리 상태
};

// 슬라이스(리듀서 + 액션) 생성
const authSlice = createSlice({
  name: "auth",
  initialState: initialState,
  reducers: {
    // 회원가입 성공 여부를 초기화(false)
    resetIsSignup: (state) => {
      state.inSignup = false;
    },
  },
  // 위에서 정의한 비동기 처리 함수(액션)을 처리할 리듀서
  extraReducers: (builder) => {
    // 각 비동기 처리에 대한
    // 대기(pending) / 성공(fulfilled) / 실패(reject)
    builder
      .addCase(signup.fulfilled, (state) => {
        // signup 비동기 처리가 성공(fulfilled)일때 실행되는 콜백함수
        state.inSignup = true;
      })
      .addCase(login.fulfilled, (state, action) => {
        // login 비동기 처리가 성공일 떄 실행되는 콜백함수
        state.token = action.payload["access_token"];
      })
      .addCase(logout.fulfilled, (state) => {
        // logout 비동기 처리가 성공(fulfilled)일때 실행되는 콜백함수 - 토큰 초기화
        state.token = null;
      })
      .addCase(signup.rejected, (state, action) => {
        // action.payload 어디서 왔는가?
        //return rejectWithValue(error["response"]["data"]);
        state.error = action.payload;
      });
  },
});

// 액션과 리듀서, 비동기 처리 액션 내보내기
export const { resetIsSignup } = authSlice.actions;
export default authSlice.reducer;
export { signup, login, logout };
