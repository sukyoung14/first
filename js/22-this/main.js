// 일반 함수에서의 this 키워드
// 전역(global) 객체를 나타낸다(가리킨다, 참조한다)
// 일반 함수에서의 this 키워드는 사용 의미가 없다
function func() {
  console.log("함수");
  console.log(this);
}
//func();

// 중괄호로 표현되는 자료형
// 객체의 특징 : key - value 속성으로 구성
// 함수도 value가 될 수 있음. 이러한 함수를 메서드라고 한다
// 즉, 객체에 포함된 함수는 메서드라고 한다.
const obj = {
  name: "홍길동",
  age: 20,
  // 함수명이 없다 -> 함수 표현식
  // 속성의 key가 func이고, value는 함수
  func: function () {
    console.log(this); // this - 객체 obj와 동일하다
  },
};
// obj 객체의 func 메서드를 실행(호출)
obj.func(); // { name: '홍길동', age: 20, func: [Function: func] }

const user = {
  name: "홍길동",
  age: 20,
  greet: function (name) {
    console.log(`Hello ${name}`);
    console.log(`Hello ${this.name}`);
    console.log(`Hello ${this}`);
  },
};
user.greet("김철수");
user.greet();

// 화살표 함수로 표현한 메서드는 함수 선언식(표현식, fucnion 키워드를 사용한 함수)작동 방식이 다르다
const user2 = {
  name: "홍길동",
  age: 20,
  greet: () => {
    console.log(`Hello ${this.name}`);
    console.log(this);
  },
};
user.greet(); // function 함수로 표현한 메서드 결과 this : { name: '홍길동', age: 20, func: [Function: func] }
user2.greet(); // 화살표 함수로 표현한 메서드 결과 this : {}
console.log(this); // 함수가 아닌 곳에서 실행한 this : {}

const user3 = {
  name: "홍길동",
  age: 20,
  greet: function () {
    const arrowFunc = () => {
      console.log(this); // { name: '홍길동', age: 20, greet: [Function: greet] }
    };
    arrowFunc();
  },
};

user3.greet();
