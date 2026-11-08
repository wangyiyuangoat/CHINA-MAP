@echo off
chcp 65001 >nul
echo ==========================================
echo   中国旅行足迹地图 · 一键推送到 GitHub
echo ==========================================
echo.

set /p REPO_URL="请输入你的 GitHub 仓库地址 (例如: https://github.com/username/china-travel-map.git): "

if "%REPO_URL%"=="" (
    echo [错误] 仓库地址不能为空！
    pause
    exit /b
)

echo.
echo [1/3] 添加所有文件并提交...
git add .
git commit -m "feat: upgrade china travel map with geojson and poster export"

echo.
echo [2/3] 配置远程仓库...
git remote remove origin >nul 2>&1
git remote add origin %REPO_URL%
git branch -M main

echo.
echo [3/3] 推送至 GitHub...
git push -u origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo ==========================================
    echo   恭喜！推送成功！
    echo   请在 GitHub 仓库的 Settings -^> Pages 中
    echo   开启 GitHub Pages (Branch 选择 main)，
    echo   即可获得你的专属在线网页链接！
    echo ==========================================
) else (
    echo.
    echo [提示] 推送失败，请检查网络或者是否已在浏览器中登录授权 GitHub。
)

echo.
pause
