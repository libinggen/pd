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



# cd

git branch 查看本地所有分支

git status 查看当前状态 

git commit 提交 

git branch -a 查看所有的分支

git branch -r 查看远程所有分支

git commit -am "init" 提交并且加注释 

git remote add origin git@000.000.1.000:ndshow

git push origin master 将文件给推到服务器上 

git remote show origin 显示远程库origin里的资源 

git push origin master:develop

git push origin master:hb-dev 将本地库与服务器上的库进行关联 

git checkout --track origin/dev 切换到远程dev分支

git branch -D master develop 删除本地库develop

git checkout -b dev 建立一个新的本地分支dev

git merge origin/dev 将分支dev与当前分支进行合并

git checkout dev 切换到本地dev分支

git remote show 查看远程库

git add .

git rm 文件名(包括路径) 从git中删除指定文件

git clone git://github.com/xxxx/grit.git 从服务器上将代码给拉下来

git config --list 看所有用户

git ls-files 看已经被提交的

git rm [file name] 删除一个文件

git commit -a 提交当前repos的所有的改变

git add [file name] 添加一个文件到git index

git commit -v 当你用－v参数的时候可以看commit的差异

git commit -m "This is the message describing the commit" 添加commit信息

git commit -a -a是代表add，把所有的change加到git index里然后再commit

git commit -a -v 一般提交命令

git log 看你commit的日志

git diff 查看尚未暂存的更新

git rm a.a 移除文件(从暂存区和工作区中删除)

git rm --cached a.a 移除文件(只从暂存区中删除)

git commit -m "remove" 移除文件(从Git中删除)

git rm -f a.a 强行移除修改后文件(从暂存区和工作区中删除)

git diff --cached 或 $ git diff --staged 查看尚未提交的更新

git stash push 将文件给push到一个临时空间中

git stash pop 将文件从临时空间pop下来


git remote add origin git@github.com:username/Hello-World.git

git push origin master 将本地项目给提交到服务器中


git pull 本地与服务器端同步


git push (远程仓库名) (分支名) 将本地分支推送到服务器上去。

git push origin serverfix:awesomebranch


git fetch 相当于是从远程获取最新版本到本地，不会自动merge

git commit -a -m "log_message" (-a是提交所有改动，-m是加入log信息) 本地修改同步至服务器端 ：

git branch branch_0.1 master 从主分支master创建branch_0.1分支

git branch -m branch_0.1 branch_1.0 将branch_0.1重命名为branch_1.0

git checkout branch_1.0/master 切换到branch_1.0/master分支

du -hs

git branch 删除远程branch

git push origin :branch_remote_name

git branch -r -d branch_remote_name


-- 

mkdir    创建一个目录    mkdir dirname

rmdir    删除一个目录    rmdir dirname

mvdir    移动或重命名一个目录    mvdir dir1 dir2

cd    改变当前目录    cd dirname

pwd    显示当前目录的路径名    pwd

ls    显示当前目录的内容    ls -la

dircmp    比较两个目录的内容    dircmp dir1 dir2


cat    显示或连接文件    cat filename

pg    分页格式化显示文件内容    pg filename

more    分屏显示文件内容    more filename

od    显示非文本文件的内容    od -c filename

cp    复制文件或目录    cp file1 file2

rm    删除文件或目录    rm filename

mv    改变文件名或所在目录    mv file1 file2

ln    联接文件    ln -s file1 file2

find    使用匹配表达式查找文件    find . -name "*.c" -print

file    显示文件类型    file filename

open    使用默认的程序打开文件    open filename


head    显示文件的最初几行    head -20 filename

tail    显示文件的最后几行    tail -15 filename

cut    显示文件每行中的某些域    cut -f1,7 -d: /etc/passwd

colrm    从标准输入中删除若干列    colrm 8 20 file2

paste    横向连接文件    paste file1 file2

diff    比较并显示两个文件的差异    diff file1 file2

sed    非交互方式流编辑器    sed "s/red/green/g" filename

grep    在文件中按模式查找    grep "^[a-zA-Z]" filename

awk    在文件中查找并处理模式    awk '{print $1 $1}' filename

sort    排序或归并文件    sort -d -f -u file1

uniq    去掉文件中的重复行    uniq file1 file2

comm    显示两有序文件的公共和非公共行    comm file1 file2

wc    统计文件的字符数、词数和行数    wc filename

nl    给文件加上行号    nl file1 >file2


passwd    修改用户密码    passwd

chmod    改变文件或目录的权限    chmod ug+x filename

umask    定义创建文件的权限掩码    umask 027

chown    改变文件或目录的属主    chown newowner filename

chgrp    改变文件或目录的所属组    chgrp staff filename

xlock    给终端上锁    xlock -remote


make    维护可执行程序的最新版本    make

touch    更新文件的访问和修改时间    touch -m 05202400 filename

dbx    命令行界面调试工具    dbx a.out

xde    图形用户界面调试工具    xde a.out


ps    显示进程当前状态    ps u

kill    终止进程    kill -9 30142

nice    改变待执行命令的优先级    nice cc -c *.c

renice    改变已运行进程的优先级    renice +20 32768


date    显示系统的当前日期和时间    date

cal    显示日历    cal 8 1996

time    统计程序的执行时间    time a.out


telnet    远程登录    telnet hpc.sp.net.edu.cn

rlogin    远程登录    rlogin hostname -l username

rsh    在远程主机执行指定命令    rsh f01n03 date

ftp    在本地主机与远程主机之间传输文件    ftp ftp.sp.net.edu.cn

rcp    在本地主机与远程主机 之间复制文件    rcp file1 host1:file2

ping    给一个网络主机发送 回应请求    ping hpc.sp.net.edu.cn

mail    阅读和发送电子邮件    mail

write    给另一用户发送报文    write username pts/1

mesg    允许或拒绝接收报文    mesg n


history    列出最近执行过的 几条命令及编号    history

r    重复执行最近执行过的 某条命令    r -2

alias    给某个命令定义别名    alias del=rm -i

unalias    取消对某个别名的定义    unalias del


uname    显示操作系统的有关信息    uname -a

clear    清除屏幕或窗口内容    clear

env    显示当前所有设置过的环境变量    env

who    列出当前登录的所有用户    who

whoami    显示当前正进行操作的用户名    whoami

tty    显示终端或伪终端的名称    tty

stty    显示或重置控制键定义    stty -a

du    查询磁盘使用情况    du -k subdir

df    显示文件系统的总空间和可用空间    df /tmp

w    显示当前系统活动的总信息    w
