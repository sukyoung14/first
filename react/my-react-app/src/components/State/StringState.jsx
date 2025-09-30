import React from "react";
import { useState } from "react";

export default function StringState() {
  const [stringState, setStringState] = useState("");

  const updateStringState = () => {
    let newString = `${stringState} 추가`;
    setStringState(newString);
  };
  return (
    <div>
      <p>{stringState}</p>
      <button
          onClick={() => {
            updateStringState();
          }}
      >
        문자열 추가
      </button>
    </div>
  );
}
