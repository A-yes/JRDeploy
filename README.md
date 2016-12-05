#JavaWeb项目一键部署平台

##说明：
- 服务器要求
	- 需要远程服务器为linux系统，
	- 远程服务器需要有  **git ，svn ,git ,mvn ,wget **命令
	- 远程服务器需要有  **jetty-distribution**
- 项目要求
	- 项目必须为maven 项目
	- maven的 <finalName> 必须与git的 项目名称一致
	- 项目必须能用 mvn package 命令生成 可发布的 war包
- 用户名密码
	- 在 src/main/resource/config/config.properties 里配置


---

- 2016-12-01
	- 新建远程部署完成
- 2016-12-05
	- 基本完成
- problem
	- ganymed打开的shell，自己配置的mvn 命令无法使用
		- 直接在/etc/environment添加maven的bin路径
	- 用sh *.sh 执行，nohup 后台进程未显示
		- sh里漏了一个参数，气死我了