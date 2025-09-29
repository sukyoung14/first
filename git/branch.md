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
