# 깃 개념
![git](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2aRJR6dWUGsjhkUzKkGp-3787npBEJcJblg&s)

## 스냅샷
- 마치 폴라로이드 카메라로 풍경을 기록하듯이 파일의 상태를 기록하는 시스템
- 한 번 기록하면 변경할 수 없다

## 3가지 영역
- 작업트리 : 프로젝트 내부에 실제로 변경된 파일이 있는 영역
- 스테이징 영역 : 변경된 파일 중 저장할 파일을 보관하는 영역
- 로컬 저장소 : 변경된 파일이 저장되는 영역 변경된 사항을 변경할수 없다

## 파일의 3가지 상태
 - 수정 : 수정을 했으나 저장소에 저장하지 않은 상태
 - 스테이징 : 임시영역으로 변경된 파일 중 저장할 파일로 선택된 상태
 - 커밋 : 저장소에 기록된 상태 

 ## 깃 명령어

 ## 변경된 파일을 스테이징 영역으로 이동하는 명령어
 - git add 파일명
 - git add git/basic.md
 - git add .
 ## 스테이징 영역에 있는 파일을 기록(커밋)하는 명령어
 - git commit
 - git commit -m "commit ok"
 ## 현재 파일 상태를 출력하는 명령어
 - git status

# gitignore
## 어떤 파일인가? 역할이 무엇인가?
 - git 프로젝트에서 특정 파일과 폴더 제외하기
 - 다른 사용자에게 노출되면 안되는 파일과 폴더를 명시하는 파일
## .gitignore의 주의사항은 무엇인가?
 - 한 번 기록(commit)한 파일은 .gitignore 파일에 추가해도 제외되지 않는다
## gitignore.io는 어떤 서비스인가?
 - 사용하는 프로그래밍 언어, 기술에 적합한 .gitignore 파일을 자동으로 생성해주는 웹 사이트

# github
## 원격 저장소 생성, 연결, 동기화
1. 원격 저장소 생성
2. 지역 저장소 - 원격 저장소 연결
- git remote add origin https://github.com/sukyoung14/first.git
3. 지역 저장소 -> 원격 저장소 Push
- git push origin main
4. 원격 저장소 파일 생성
5. 지역 저장소 <- 원격 저장소 pull
- git pull origin main

## git push origin, origin은 무엇인가?
- `git push <원격저장소명> <브랜치명>` / `git pull <원격저장소명> <브랜치명>`
- `git remote add <원격저장소명> <원격저장소 주소>`
- `origin`이라는 원격저장소명은 관습적인 이름

## 원격 저장소란 무엇인가?

## 지역 저장소와 원격 저장소의 구분