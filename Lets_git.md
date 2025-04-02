# LetsGit
Git 초보를 위한 연습장

### 𝟭. 'LetsGit' Clone
```
git clone <깃허브 주소>
```
- 미션을 하기 위해서 제가 올려놓은 프로젝트를 clone 해주세요 !!

### 𝟮. ISSUE 생성
- LetsGit의 Issues를 들어가주세요.
![](https://velog.velcdn.com/images/xxoznge/post/c162542d-5941-456f-8008-127230be2fa1/image.png)
- New issue > ✨ [FEATURE] Get Started 에 들어가서 이슈 생성을 해보세요. 미리 템플릿을 만들어두었으니 작성해보세요.

### 𝟯. branch 만들기
```
1. git pull origin main -> 다른 사람이 업데이트해놨다면 먼저 pull 해주세요!
2. git branch -> 브랜치 확인
3. git branch feature/#1 -> 브랜치 이름은 자신이 생성한 이슈 번호로 // 꼭 main 에서 브랜치 생성하기기
4. git branch -> 잘 생성됐는지 확인
5. git checkout feature/#1 -> 자신의 브랜치로 이동하기
6. git branch -> 내가 어디에 있는지 확인 또 확인... 
```

### 5. 깃허브에 업로드 해보기
```
1. git add .
2. git commit -m "커밋메시지" 
3. git push origin "자신의 branch 이름"
```

### 6. PR 생성
- 이 사진엔 없지만 push를 하면 위에 pr 생성을 하도록 문구가 뜹니다.
![](https://velog.velcdn.com/images/xxoznge/post/d810f0e1-cbb0-4065-8808-96ec8b43366f/image.png)

- 미리 만들어둔 PR 템플릿에 작성해주세요. (resolve 옆에는 자신의 이슈 번호)

### 7. Merge 하기
- PR까지 완료했다면 합쳐봅시다 !!! 
- 'Squash and merge' 이용용