@echo off
chcp 65001 >nul
cd /d "%~dp0"
set "PATH=%PATH%;%APPDATA%\Python\Python314\Scripts"
echo 正在启动 Resume-Matcher（会开两个黑窗口：后端 + 前端，别关）...
start "Resume-Matcher 后端 :8000" cmd /k "cd /d %~dp0apps\backend && uv run app"
start "Resume-Matcher 前端 :3000" cmd /k "cd /d %~dp0apps\frontend && npm run dev"
echo 等待前端就绪后自动打开浏览器...
timeout /t 12 >nul
start http://localhost:3000
echo 用完把两个黑窗口关掉即可停止。
