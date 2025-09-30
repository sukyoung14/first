import React from "react";

export default function Card({ user, onClickProps }) {
  return (
    <div>
      <button
        onClick={() => {
          onClickProps(user);
        }}
      >
        클릭
      </button>
    </div>
  );
}
