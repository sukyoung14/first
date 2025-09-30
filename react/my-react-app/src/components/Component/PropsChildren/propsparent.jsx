import React from "react";
import propschild from "./propschild";
export default function propsparent() {
  return (
    <div>
      <div>
        <children>
          <div>
            <h1>나는 길동</h1>
            <h2>I'm 20살</h2>
          </div>
        </children>
        <children>
          <div>
            <h1>나는 철수</h1>
            <h2>I'm 22살</h2>
          </div>
        </children>
        <children>
          <div>
            <h1>나는 짱구</h1>
            <h2>I'm 7살</h2>
          </div>
        </children>
      </div>
    </div>
  );
}
