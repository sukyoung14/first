import React from "react";
import { useState } from "react";

export default function NumberState() {
  const [numberState, setNumberState] = useState(0);

  const updateNumberState = () => {
    let newNumber = numberState + 1;
    setNumberState(newNumber);
  };
  return (
    <div>
      <p>{numberState}</p>
      <button
        onClick={() => {
          updateNumberState();
        }}
      >
        카운트 증가
      </button>
    </div>
  );
}
