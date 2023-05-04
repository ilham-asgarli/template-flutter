git init
git branch -M main
:origin_set
set /p "origin=Origin: "
if [%origin%]==[] goto :origin_set
git remote add origin %origin%
.\push.cmd