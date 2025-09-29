import React from "react";

export default function OnClick() {
  function handelClick(evnet) {
    alert("클릭");
  }
  return (
    <div>
      <button
        onClick={(event) => {
          handelClick(event);
        }}
      >
        클릭
      </button>
    </div>
  );
}
