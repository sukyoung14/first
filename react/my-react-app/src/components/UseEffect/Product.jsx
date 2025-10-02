import React from "react";

// 구조 분해 할당을 활용해서 객체 props를 분해
// product : 개별 상품 정보를 저장하는 객체
export default function Product({ product }) {
  const cardStyle = {
    border: "1px solid #ddd",
    borderRadius: "8px",
    padding: "16px",
    margin: "16px 0",
    boxShadow: "0 2px 4px rgba(0,0,0,0.1)",
  };

  const titleStyle = {
    fontSize: "1.25rem",
    fontWeight: "bold",
    marginBottom: "8px",
  };

  const descriptionStyle = {
    fontSize: "1rem",
    color: "#555",
  };

  return (
    <div style={cardStyle}>
      <p style={titleStyle}></p>
      <p style={descriptionStyle}>{product.description}</p>
    </div>
  );
}
