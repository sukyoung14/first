import React from "react";

export default function Card({ onClick }) {
  return (
    <div>
      <button
        onClick={() => {
          onClick();
        }}
      >
        카드 클릭하기
      </button>
    </div>
  );
}
