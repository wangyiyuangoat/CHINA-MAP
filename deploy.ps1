# Set UTF-8 encoding
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$Host.UI.RawUI.WindowTitle = "China Travel Map - Push to GitHub"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "   中国旅行足迹地图 · 一键推送到 GitHub   " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

$repoUrl = Read-Host "请输入你的 GitHub 仓库地址 (例如: https://github.com/用户名/china-travel-map.git)"
$repoUrl = $repoUrl.Trim()

if ([string]::IsNullOrWhiteSpace($repoUrl)) {
    Write-Host "[错误] 仓库地址不能为空！" -ForegroundColor Red
    Write-Host ""
    Read-Host "按 Enter 键退出..."
    exit
}

Set-Location $PSScriptRoot

Write-Host ""
Write-Host "[1/3] 检查文件并提交..." -ForegroundColor Yellow
git add .
git commit -m "feat: upgrade china travel map with geojson and poster export" 2>$null

Write-Host ""
Write-Host "[2/3] 配置远程仓库..." -ForegroundColor Yellow
git remote remove origin 2>$null
git remote add origin $repoUrl
git branch -M main

Write-Host ""
Write-Host "[3/3] 推送至 GitHub main 分支..." -ForegroundColor Yellow
Write-Host "(如果弹出 GitHub 登录窗口，请在浏览器中确认授权即可)" -ForegroundColor Gray
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "==========================================" -ForegroundColor Green
    Write-Host "   🎉 恭喜！推送成功！" -ForegroundColor Green
    Write-Host "==========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "开启 GitHub Pages 网站步骤：" -ForegroundColor Cyan
    Write-Host "1. 打开 GitHub 仓库页面，点击顶部的 Settings"
    Write-Host "2. 在左侧菜单点击 Pages"
    Write-Host "3. 在 Branch 下拉框选择 main，点击 Save"
    Write-Host "4. 稍等 1 分钟即可得到你的在线网址！"
} else {
    Write-Host ""
    Write-Host "[提示] 推送遇到问题，可能的原因：" -ForegroundColor Yellow
    Write-Host "1. 仓库地址是否输入正确？"
    Write-Host "2. 是否需要在浏览器中登录 GitHub 授权？"
    Write-Host "3. 若仓库已包含 README 等文件，可在本地运行 git pull origin main --rebase 后再推"
}

Write-Host ""
Read-Host "按 Enter 键退出..."
