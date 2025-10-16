// configureStore : 리듀서를 받아서 스토어를 생성하는 함수
import { configureStore } from "@reduxjs/toolkit";
// 리듀서 불러오기
import counterReducer from "./counterSlice";
// 인증 리듀서 불러오기
import authReducer from "./authSlice";
// Redux Persist
import { persistStore, persistReducer } from "redux-persist";
// 로컬 스토리지
import storage from "redux-persist/lib/storage";

import {
  FLUSH,
  REHYDRATE,
  PAUSE,
  PERSIST,
  PURGE,
  REGISTER,
} from "redux-persist";

// Persist Reducer 설정변수
const authPersistConfig = {
  key: "auth", // 로컬 스토리지 내 속성명(식별자)
  storage: storage, //사용할 로컬 스토리지 (localStorage)
  whitelist: ["token"],
};

// persistReducer : 지속가능한 리듀서를 생성하는 함수
// authPersistConfig : 설정
// authReducer : 원본 리듀서
const persistedAuthReducer = persistReducer(authPersistConfig, authReducer);
// 스토어 생성
export const store = configureStore({
  reducer: {
    // state.counter.count 의 "counter"는 아래 리듀서의 속성명(key) === 상태명
    counter: counterReducer, // counter의 속성명을 여기서 결정
    //auth: authReducer,
    auth: persistedAuthReducer,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({
      serializableCheck: {
        ignoredActions: [FLUSH, REHYDRATE, PAUSE, PERSIST, PURGE, REGISTER],
      },
    }),
});

// Persist 스토어 생성 및 내보내기
export const persistor = persistStore(store);
