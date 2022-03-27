# pd

mkdir pd

cd pd

git init

git add README.md

git commit -m "init"

git branch -M main

git remote add origin https://github.com/libinggen/pd.git

git push -u origin main



-- 

git branch master  

git push -u origin master

git branch develop  

git push -u origin develop


-- 

git checkout -b feature develop

git push -u origin feature

git pull origin develop

git checkout develop 

--no-ff：不使用fast-forward方式合并，保留分支的commit历史

--squash：使用squash方式合并，把多次分支commit历史压缩为一次

git merge --no-ff feature

git push origin develop


git branch -d some-feature

--如果需要删除远程feature分支:

git push origin --delete some-feature



-- 

git checkout -b release-0.1.0 develop

git checkout master

git merge --no-ff release-0.1.0

git push

git checkout develop

git merge --no-ff release-0.1.0

git push


git branch -d release-0.1.0

git push origin --delete release-0.1.0   


-- 合并master/devlop分支之后，打上tag 

git tag -a v0.1.0 -m"2022-03-24 git command" master

git push --tags



-- 

git checkout -b hotfix-0.1.1 master


git checkout master

git merge --no-ff hotfix-0.1.1

git push


git checkout develop

git merge --no-ff hotfix-0.1.1

git push


git branch -d hotfix-0.1.1

git push origin --delete  hotfix-0.1.1


git tag -a v0.1.1 -m"2022-03-24 hotfix" master

git push --tags



-- 

git status

git diff

git add .

git commit -m "command"

git push

git stash

git restore

-- 

php -v

mkdir php

php -S 0.0.0.0:端口 -t 目录

cd php

touch phpinfo.php

```
<?php
phpinfo();
```

http://localhost:8080/phpinfo.php


-- 

