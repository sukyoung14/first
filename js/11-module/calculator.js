function add(n1, n2) {
  return n1 + n2;
}

// 하나만 내보내기
//export default add;

// 객체란 중괄호로 표현되는 속성의 모음
const calObject = {
  add: function (n1, n2) {
    return n1 + n2;
  },
  substract: function (n1, n2) {
    return n1 - n2;
  },
  multiply: function (n1, n2) {
    return n1 * n2;
  },
  devide: function (n1, n2) {
    return n1 / n2;
  },
  //multiply 화살표 함수
  multiplyArrow: (n1, n2) => {
    return n1 * n2;
  },
};

// 하나만 내보내기
//export default calObject.multiply;
export default calObject;
