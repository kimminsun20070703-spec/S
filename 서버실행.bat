@echo off
chcp 65001 > nul
title A-Frame 로컬 웹 서버
echo 서버를 시작합니다... 브라우저가 자동으로 열립니다.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0server.ps1"
pause
