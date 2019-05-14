@echo off

rem exit /b 0

git add .
git add -u
git commit -i -m "%1"
git push