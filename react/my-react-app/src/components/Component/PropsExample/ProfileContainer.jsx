import React from "react";
import Profile from "./Profile";

export default function ProfileContainer() {
  const user = {
    name: "정현우",
    age: 22,
    isAdmin: true,
  };

  return (
    <div>
      <Profile user={user} />
    </div>
  );
}
