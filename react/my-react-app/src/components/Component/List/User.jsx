import React from "react";

export default function user({ key, user }) {
  return (
    <div>
      <li>
        {user["id"]} - {user["name"]}
      </li>
    </div>
  );
}
