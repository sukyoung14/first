import React from "react";
import Form from "./Form";

export default function FormContainer() {
  function handleSubmit(event) {
    const { elements } = event["target"]["elements"];
    console.log(event["target"]["elements"]["email"]["value"]);
    console.log(event["target"]["elements"]["name"]["value"]);
    console.log(event["target"]["elements"]["password"]["value"]);
    //const { name, email, password } = elements;
    alert(
      `이름: ${name["value"]}, 이메일: ${email["value"]}, 비밀번호: ${password["value"]}`
    );
    // alert(
    //   `이름: ${name["value"]}, 이메일: ${email["value"]}, 비밀번호: ${password["value"]}`
    // );
    event.preventDefault();
  }
  function handleChange(event) {
    console.log(event["target"]["value"]);
  }

  return (
    <>
      <h1 className="text-2xl font-bold">FormContainer</h1>
      <Form onSubmit={handleSubmit} onChange={handleChange} />
    </>
  );
}
