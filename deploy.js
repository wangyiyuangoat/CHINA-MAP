const readline = require('readline');
const { execSync } = require('child_process');
const path = require('path');

process.chdir(__dirname);

console.log('==========================================');
console.log('   中国旅行足迹地图 · 一键推送到 GitHub   ');
console.log('==========================================\n');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('请输入你的 GitHub 仓库地址 (例如 https://github.com/用户名/china-travel-map.git):\n> ', (answer) => {
  const repoUrl = (answer || '').trim();
  if (!repoUrl) {
    console.log('\n❌ [错误] 仓库地址不能为空！');
    rl.close();
    return;
  }

  try {
    console.log('\n[1/3] 检查文件并提交...');
    try { execSync('git add .', { stdio: 'inherit' }); } catch(e){}
    try { execSync('git commit -m "feat: upgrade china travel map with geojson and poster export"', { stdio: 'inherit' }); } catch(e){}

    console.log('\n[2/3] 配置远程仓库...');
    try { execSync('git remote remove origin', { stdio: 'ignore' }); } catch(e){}
    execSync(`git remote add origin ${repoUrl}`, { stdio: 'inherit' });
    execSync('git branch -M main', { stdio: 'inherit' });

    console.log('\n[3/3] 推送至 GitHub main 分支...');
    console.log('(如果弹出 GitHub 登录窗口，请在浏览器中确认登录即可)\n');
    execSync('git push -u origin main', { stdio: 'inherit' });

    console.log('\n==========================================');
    console.log('   🎉 恭喜！代码推送成功！');
    console.log('==========================================\n');
    console.log('开启 GitHub Pages 网站步骤：');
    console.log('1. 打开 GitHub 仓库页面，点击顶部的 Settings');
    console.log('2. 在左侧菜单点击 Pages');
    console.log('3. 在 Branch 下拉框选择 main，点击 Save');
    console.log('4. 稍等约 1 分钟即可在页面顶部得到你的在线网址！\n');
  } catch (err) {
    console.log('\n⚠️ [提示] 推送遇到问题，可能的原因：');
    console.log('1. 仓库地址是否输入正确？');
    console.log('2. 是否在 GitHub 授权登录弹窗中完成授权？');
    console.log('3. 若新建仓库时勾选了"Add a README"，可在命令行运行 git pull origin main --rebase 后重试。\n');
  }

  rl.close();
});
