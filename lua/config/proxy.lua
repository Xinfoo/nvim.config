-- 针对下载插件的代理配置
local proxy_url = "http://127.0.0.1:7897"

vim.env.http_proxy = proxy_url
vim.env.https_proxy = proxy_url
