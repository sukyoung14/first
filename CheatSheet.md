# 용어 정리

## 객체(object)

- 객체 OOO 에서 XXX 를 꺼내오기
- 객체 OOO 에서 XXX 를 추출
- 객체 OOO 에서 속성 XXX 접근하기

```jsx
// 객체 변수 object는
// 어떤 속성을 가지고 있는가?
// key(속성의 이름)가 id 이고, value(값) 1 인 속성
// key(속성의 이름)가 name 이고, value(속성의 값) 이 "홍길동" 인 속성
const object = { id: 1, name: "홍길동", age: 20 };

// 객체 object에서 id를 꺼내오기
// 객체 변수 object에서 속성의 이름이 id 인 값을 꺼내오기
object["id"];

// 객체 object에서 name 추출
// 객체 변수 object에서 속성의 이름이 name 인 값을 꺼내오기(접근하기, 추출하기)
object["name"];
```

## 프롭스(Props)

- 컴포넌트(태그, 요소) OOO 의 XXX 속성에 ㅁㅁㅁ 를 전달하라
- 컴포넌트(태그, 요소) OOO 의 xxx 속성에 ㅁㅁㅁ 를 설정하라
- 컴포넌트(태그, 요소) OOO 의 xxx 속성에 ㅁㅁㅁ 을 Props 로 전달하라

```jsx
<OOO컴포넌트 XXX={ㅁㅁㅁ}></OOO컴포넌트>
```
