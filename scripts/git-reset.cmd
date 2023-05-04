set /p "commit_ref=Commit reference: "
git reset %commit_ref%
git push -f