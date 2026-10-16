# Cloudflare Pages 自动部署

## 第一次配置

1. 将此目录内容推送到 GitHub 仓库根目录。
2. Cloudflare → Workers & Pages → 创建应用 → Pages → 连接 Git，选择该仓库。
3. 生产分支：main；框架：None；构建命令：sh ./build-cloudflare.sh；输出目录：public；根目录：留空。
4. 构建环境变量 KITE_SITE_BASEURL 填写正式网址，例如 https://你的项目.pages.dev。有自定义域名时填写该域名。
5. 点击部署。如果暂未设置该变量，脚本会使用 Cloudflare 提供的 CF_PAGES_URL；确认正式网址后设置 KITE_SITE_BASEURL 并重新部署。

## 日常写作

在本目录运行 sh ./kitew run，打开 http://127.0.0.1:1717/admin/ 写作并保存。然后在本目录运行：

```sh
git add .
git commit -m "更新博客"
git push
```

Cloudflare 会在收到推送后构建、发布。不需要手动打包。仅在后台保存不会触发公网更新。

静态构建默认排除草稿。此项目未包含原项目针对 GitHub Pages 的部署工作流。
