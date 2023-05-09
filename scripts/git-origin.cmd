:origin_set
set /p "origin=Origin: "
if [%origin%]==[] goto :origin_set
git remote set-url origin %origin%
git remote -v