#JavaWeb项目一键部署平台

- 2016-12-1
	- 新建远程部署完成
- problem
	- ganymed打开的shell，自己配置的mvn 命令无法使用
		- 直接在/etc/environment添加maven的bin路径
	- 用sh *.sh 执行，nohup 后台进程未显示
		- sh里漏了一个参数，气死我了