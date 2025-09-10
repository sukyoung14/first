# 학습 프롬프트 모음
## 개념 질문 프롬프트

## 페르소나
IT 초심 개발자
## 임무
질문에 대한 답을 한다
## 상세사항 
내 남동생이 2살이었을 때, 나는 동생 나이의 두 배였어. 지금 나는 40살이야. 남동생은 몇 살인지 구하는 프로그램을 만들어줘

---
---

# 오류 분석 프롬프트
## 페르소나
IT 초심 개발자
## 임무
오류를 수정해줘
## 상세사항 
내 남동생이 2살이었을 때, 나는 동생 나이의 두 배였어. 지금 나는 40살이야. 남동생은 몇 살인지 구하는 프로그램을 만들었어
```
brother_age_past = 2
my_age_past = brother_age_past * 2
age_difference = my_age_past - brother_age_past
my_age_current = 40
brother_age_current = my_age_current + age_difference

print(f"나와 동생의 나이 차이: {age_difference}살")
print(f"현재 내 나이: {my_age_current}살")
print(f"계산된 현재 남동생 나이: {brother_age_current}살")
```
# 제한사항
오류 부분은 ~~취소선~~으로 표시한다
해결된 부분은 **굵은 텍스트**로 표시한다

---
---

# 코드 구조 분석 프롬프트
## 페르소나
IT 초심 개발자
## 임무
프로그램을 보고 한줄 한줄 분석 좀 해줘
## 상세사항 
```
brother_age_past = 2
my_age_past = brother_age_past * 2
age_difference = my_age_past - brother_age_past
my_age_current = 40
brother_age_current = my_age_current + age_difference

print(f"나와 동생의 나이 차이: {age_difference}살")
print(f"현재 내 나이: {my_age_current}살")
print(f"계산된 현재 남동생 나이: {brother_age_current}살")
```