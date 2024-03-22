# qubic_check_solution_number
A Linux shell script that sends an email message when the computer finds new solutions.
# 更新
sudo apt update
# 安装mail命令, Postfix Configuration界面选择No configuration
sudo apt-get install mailutils
# 安装ssmtp
sudo apt install ssmtp
# 进入网易云或其他邮箱 开启ssmtp

sudo vim /etc/ssmtp/ssmtp.conf
# 如果提示vim 未安装执行 sudo apt install vim
## 按下insert键向ssmtp.conf添加以下内容
root=username@163.com #邮箱地址
mailhub=smtp.163.com:465  #邮箱设置，其他邮箱请查阅相关网页
AuthUser=username@163.com  
AuthPass=xxxxxxxx # 网易邮箱的授权码
UseTLS=Yes
## 按esc键后按下小写wq，随后按下enter键退出ssmtp.conf文件

sudo vim /etc/ssmtp/revaliases
## ## 按下insert键向revaliases中添加以下内容
ltt:1********66@163.com:smtp.163.com:465    #用户名:邮箱:mailhub
## 按esc键后按下小写wq，随后按下enter键退出revaliases文件

# 进入到check_solutions.sh所在文件夹，右键打开终端，在新打开的终端中执行
sudo chmod +x check_solutions.sh
# 编辑config.json文件
sudo vim config.json
## 按下insert键向config.json添加以下内容
