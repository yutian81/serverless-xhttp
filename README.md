

# serverless-xhttp
* huggingface分支，也可用于其他任意docker平台部署
* serverless-vless-xhttp，集成哪吒探针，v0或v1可选。

## huggingface 部署指南
* Fork 此项目，取消Copy the main branch only的勾选使其fork所有分支
* 在huggingface创建空白docker项目,获取域名，格式：账户名-项目名.hf.space 将域名填写到app.js里的DOMAIN变量
* 在app.js里填写好uuid或哪吒等变量后，全选代码到 https://obfuscator.io 混淆，选Medium或以上混淆级别，将混淆后的代码全选粘贴到app.js保存，去Actions运行构建镜像(首次需要手动，之后每次修改自动构建)
* 在huggingface创建空白docker项目，创建Dockerfile文件，里面填写`FROM 自己的镜像地址` 保存即可
* 分配的域名/$UUID 获取节点


* 环境变量
  | 变量名        | 是否必须 | 默认值 | 备注 |
  | ------------ | ------ | ------ | ------ |
  | PORT         | 是 |  7860  |http服务监听端口，也是订阅端口     |
  | UUID         | 否 | a2056d0d-c98e-4aeb-9aab-37f64edd5710|UUID,使用哪吒v1在不同的平台部署需要修改|
  | NEZHA_SERVER | 否 |        | 哪吒面板域名，v1：nz.xxx.com:8008  v0: nz.xxx.com  |
  | NEZHA_PORT   | 否 |        | 哪吒v1没有此项，哪吒v0端口为{443,8443,2096,2087,2083,2053}其中之一时，开启tls|
  | NEZHA_KEY    | 否 |        | 哪吒v1 或v0 密钥                 |
  | DOMAIN       | 否 |        | 项目域名                         |
  | XPATH        | 否 |  xhttp | 节点路径                         | 
  | AUTO_ACCESS  | 否 |  false | 自动保活，true开启,false关闭       |
  | SUB_PATH     | 否 | 你的uuid| 节点订阅路径                      |
  | NAME         | 否 | Hug    | 节点名称                         |
