# 🗺️ 中国旅行足迹地图 · China Travel Photo Map

一个优雅、沉浸式的交互式中国旅行足迹与相册地图网页应用。

![Preview](preview.png)

## ✨ 核心特性

- **官方标准高精度矢量地图**：采用阿里云 DataV 官方最新标准中国地理 GeoJSON 数据，包含 34 个省级行政区及完整的南海诸岛、十段线。
- **照片填满省份 (Mosaic Collage)**：每个省份支持上传多张旅行照片。在总览模式下，照片将按照省份的精确几何轮廓进行无损裁切填充，支持多图智能并排/网格拼贴，呈现独特的相片拼图质感！
- **足迹探索统计**：顶部微件实时显示“已去 X / 34 个省市 (百分比)”及动态进度条，支持一键打开已打卡与待探索省份清单。
- **省份抽屉面板**：点击任意省份滑出右侧详情面板，支持拖拽批量上传、实时拼贴微缩预览、旅行日期与足迹心得备注。
- **全屏高清相片灯箱 (Lightbox)**：支持大图查看、键盘左右箭头切换与 Esc 关闭。
- **🎨 艺术海报导出**：还原极简高级海报质感！
  - 顶部大标题：`C H I N A`（可自定义）
  - 中间：全国旅行相片拼贴版图（支持切换“留白隐藏未打卡省份”或“淡雅剪影底图”）
  - 底部：自动计算的旅行日期区间 `2024.06.26 — 2026.11.08` 与品牌署名 `L U M A P`
  - 纸质主题：经典米白纸质、曜石黑金、雪域纯白、复古牛皮纸
  - 一键导出 3倍 超高清 PNG / JPG 格式，可直接打印或发小红书/朋友圈！
- **本地海量存储**：基于浏览器原生 `IndexedDB` 技术，无惧几十兆高清相片存储限制，数据完全保存在个人浏览器本地，安全隐私。

---

## 🚀 部署到 GitHub Pages (获得专属网页链接)

本项目为纯前端静态页面，所有依赖库（D3.js、html2canvas、地图数据）均已内置在仓库内，无需任何构建步骤，任何人点开链接即可使用。

### 1. 新建 GitHub 仓库
1. 打开 [https://github.com/new](https://github.com/new)
2. 仓库名填写例如：`china-travel-map`
3. 选择 **Public**（公开），点击 **Create repository**

### 2. 推送代码到 GitHub
在项目根目录下打开终端（PowerShell 或 Git Bash），运行：

```bash
git remote add origin https://github.com/你的GitHub用户名/china-travel-map.git
git branch -M main
git push -u origin main
```

### 3. 开启免费在线网页 (GitHub Pages)
1. 打开 GitHub 上你的仓库页面，点击顶部的 **Settings**（设置）
2. 在左侧菜单点击 **Pages**
3. 在 **Branch** 下拉框中选择 `main` 分支，目录保持 `/ (root)`，点击 **Save**（保存）
4. 等待约 1 分钟刷新页面，即可看到生成的公网访问网址：
   `https://<你的GitHub用户名>.github.io/china-travel-map/`

现在你可以把这个网址分享给朋友，或者在手机/电脑浏览器中直接打开体验！

---

## 🛠️ 本地运行

直接双击打开 `index.html`，或者在项目目录使用静态服务器打开：

```bash
# 使用 Node.js
npx serve

# 或使用 Python
python -m http.server 8000
```
