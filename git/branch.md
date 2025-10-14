# git branch

## 브랜치 명령어

### `git branch`

- git 프로젝트의 브랜치 목록 출력

### `git branch <브랜치명>`

- 새로운 브랜치 생성
- 작업 공간을 생성

### `git switch <브랜치명>`

- 브랜치 전환
- 작업 공간을 바꾸다
- `git checkout` : 현재는 사용 안함

### `git branch -d <브랜치명>`

- 병합이 된 브랜치만 삭제

### `git branch -D <브랜치명>`

- 병합이 안된 브랜치도 삭제(강제삭제)
- 조심히 삭제 해야 한다

## 서브(기능) 브랜치 워크플로우

1. 브랜치 생성 `git branch <브랜치명>` <!-- git branch git-branch -->
2. 브랜치 전환 `git switch <브랜치명>` <!-- git switch git-branch -->
3. 작업
4. `git add .`
5. `git commit -m "커밋 메세지`
6. 브랜치 전환 `git switch main`
7. 브랜치 병합 `git merge <브랜치명>` <!-- git merge git-branch -->
8. 브랜치 삭제 `git branch -d <브랜치명>` <!-- git branch -d git-branch -->

- 추후 문제 발생 가능성 : 동일한 브랜치명을 못 사용 한다는 문제

## git 병합 워크플로우

1. 브랜치 생성 `git branch <브랜치명>` <!-- git branch git-branch -->
2. 브랜치 전환 `git switch <브랜치명>` <!-- git switch git-branch -->
3. 작업
4. `git add .`
5. `git commit -m "커밋 메세지`
6. `git push origin <브랜치명>` <!-- git push origin git-branch -->
7. gitHub 저장소 접속
8. GitHub 병합 처리
   1. 상단 `Pull requests` 클릭
   2. `New pull request` 클릭
   3. compare를 병합할 브랜치로 변경
   4. `Create pull request` 클릭
   5. 제목(title)과 설명(description) 작성
   6. `Create pull request` 클릭
   7. 코드 검토(리뷰)
   8. 3개의 병합 방법 중 하나를 선택해서 병합 처리
   9. 브랜치 삭제
9. (로컬) git switch main
10. (로컬) git pull origin main
11. (로컬) 브랜치 삭제 `git branch -D <브랜치명>` <!-- git branch -D git-branch - 로컬에서는 병합이 안되어서...d로는 삭제가 안된다-->

### 병합 방식 차이

- merge : 병합 커밋이 생성된다
- rebase : 여러개의 커밋을 main 브랜치에 재배치된다
- squash : 여러개의 커밋을 하나로 합쳐서 재배치 한다.
