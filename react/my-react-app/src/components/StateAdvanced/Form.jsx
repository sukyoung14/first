import React from "react";
import { useState } from "react";
export default function Form() {
  const [username, setUsername] = useState("");
  const [age, setAge] = useState(0);
  const [email, setEmail] = useState("");
  const [form, setForm] = useState({
    name: "",
    age: "",
    email: "",
  });

  function handleChange(event) {
    const { name, value } = event["target"];
    //setForm({ ...form, [name]: value });

    // const target = event["target"];
    // console.log(target);
    // // target 객체에서 name속성과 value 속성 꺼내서 출력

    // const { name, value } = target;
    // if (name === "username") setUsername(value);
    // else if (name === "age") setAge(value);
    // else if (name === "email") setEmail(value);
  }
  return (
    <div>
      <form action="">
        {/* 왼쪽 value : thrtjd / 오른쪽 {변수} : 상태 변수 */}
        <input type="checkbox" />
        <input
          type="text"
          name="username"
          className="border-2  rounded-md p-2c"
          value={form["username"]}
          onChange={(event) => {
            handleChange(event);
          }}
        />
        <input
          type="number"
          name="age"
          className="border-2  rounded-md p-2"
          value={form["age"]}
          onChange={(event) => {
            handleChange(event);
          }}
        />
        <input
          type="email"
          name="email"
          className="border-2 rounded-md p-2 "
          value={form["email"]}
          onChange={(event) => {
            handleChange(event);
          }}
        />
      </form>
    </div>

  );
}
