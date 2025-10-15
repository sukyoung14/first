import React from "react";
import { reset } from "../store/counterSlice";
import { useDispatch } from "react-redux";

export default function CounterReset() {
  const dispatch = useDispatch();
  return (
    <div>
      <button
        onClick={() => {
          dispatch(reset());
        }}
      >
        리셋
      </button>
    </div>
  );
}
