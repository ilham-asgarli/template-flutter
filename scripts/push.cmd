git add .
set /p "message=Message: "
if [%message%]==[] ( set "message=Initial commit" )
git commit -m "%message%"
git push -u origin main