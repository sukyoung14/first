import React from "react";
import { useState } from "react";

export default function ObjectState() {
  const [objectState, setObjectState] = useState({
    age: 19,
    name: "홍길동",
  });

  const updateObjectState = () => {
    let newObjectState = {
      ...objectState,
      age: objectState.age + 1,
    };

    setObjectState(newObjectState);
  };
  return (
    <div>
      <p>이름 : {objectState.name}</p>
      <p>나이 : {objectState.age}</p>
      <button
        onClick={() => {
          updateObjectState();
        }}
      >
        나이 증가
      </button>
    </div>
  );
}
