# qubic_check_solution_number
A Linux shell script that sends an email message when the computer finds new solutions.
# 更新
sudo apt update
# 安装mail命令, Postfix Configuration界面选择No configuration
sudo apt-get install mailutils
# 安装ssmtp
sudo apt install ssmtp
# 安装vim
sudo apt install vim
# 安装jq
sudo apt install jq

# 进入网易云或其他邮箱 开启ssmtp，具体操作请百度
https://blog.csdn.net/qq_34345149/article/details/107483029

# 编辑配置文件
sudo vim /etc/ssmtp/ssmtp.conf\
按下insert键向ssmtp.conf添加以下内容:\
root=1********66@163.com\
mailhub=smtp.163.com:465\
AuthUser=1********66@163.com\
AuthPass=xxxxxxxx # 网易邮箱授权密码\
UseTLS=Yes\
按esc键后按下小写wq，随后按下enter键退出ssmtp.conf文件

# 编辑配置文件
sudo vim /etc/ssmtp/revaliases\
按下insert键向revaliases中添加以下内容\
ltt:1********66@163.com:smtp.163.com:465    #用户名:邮箱:mailhub\
按esc键后按下小写wq，随后按下enter键退出revaliases文件\

# 进入到check_solutions.sh所在文件夹，右键打开终端，在新打开的终端中执行
sudo chmod +x check_solutions.sh
# 编辑config.json文件
在config.json文件中修改邮箱及机器名称，json中的邮箱与前文配置文件中的邮箱不同。
# 间隔600s执行脚本，可自行修改，单位为秒
watch -n 600 $(pwd)/check_solutions.sh

# 停止命令
ctrl+c


