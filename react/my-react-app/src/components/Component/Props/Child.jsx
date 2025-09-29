import React from "react";

export default function Child(props) {
  console.log(props);
  return (
    <div>
      <h1>{props["name"]}</h1>
      <h2>{props["age"]}</h2>
    </div>
  );
}
