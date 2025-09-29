import React from "react";

export default function OnChange() {
  // 이벤트 핸들러의 event 객체 : 이벤트 정보 저장한 객체
  function handelChange(event) {
    console.log(event["target"]);
    console.log(event["target"]["value"]);
  }
  // 사용자 입력값이 10보다 작으면
  // console.log()fmf tkdydgotj "10보다 작은 수"라고 출력
  function handleNumberChange(event) {
    if (event["target"]["value"] < 10) console.log("10보다 작은 수");
    const value = event["target"]["value"];
    console.log(value < 10 ? "10보다 작은 수" : "10보다 큰 수");
  }

  return (
    <div>
      {/* onChange 이벤트 속성에서 이벤트 객체를 전달하면서 handleNumberChange 호출 */}
      <input
        className="border-2 border-amber-200"
        type="text"
        onChange={(event) => {
          handleNumberChange(event);
        }}
      />
      <input
        className="border-2"
        type="text"
        onChange={(event) => {
          handelChange(event);
        }}
      />
    </div>
  );
}
