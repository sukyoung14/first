import React from "react";
import { useEffect, useState } from "react";

export default function Basic() {
  const [number, setNumber] = useState(0);
  const [number2, setNumber2] = useState(0);
  // useEffect 훅은 데이터를 생성하는 훅 X
  useEffect(() => {
    // 콜백 함수
    // 화면 랜더링과 관련 없는 일을 한다
    // API 요청하기, 타이머 시작하기 등등
    console.log("의존성 배열이 없는 useEffect");
    // 데이터를 구분하지 않고 실행
  });
  useEffect(() => {
    console.log("의존성 배열이 있는데 빈 배열인 useEffect"); //랜더링될때 최초 1번만 실행
  }, []);
  useEffect(() => {
    console.log("의존성 배열에 number 상태가 저장"); //number가 변경될때 마다
  }, [number]);
  useEffect(() => {
    console.log("의존성 배열이 number2 상태가 저장"); //number2가 변경될때 마다
  }, [number2]);
  useEffect(() => {
    const intervalId = setInterval(() => {
      console.log();
    }, 1000);
    //정리함수
    return () => {
      clearInterval(intervalId); //정리함수 : 컴포넌트가 clear 될때 사용한다. 사용 안하면 메모리 누수가 일어날수 있다
    };
  });
  //async 함수로

  return (
    <>
      <button
        onClick={() => {
          setNumber(number + 1);
        }}
      >
        {number}
      </button>
      <button
        onClick={() => {
          setNumber2(number2 + 1);
        }}
      >
        {number2}
      </button>
    </>
  );
}
