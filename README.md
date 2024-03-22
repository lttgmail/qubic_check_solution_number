# qubic_check_solution_number
A Linux shell script that sends an email message when the computer finds new solutions.
# 更新 (Update)
sudo apt update
# 安装mail命令, Postfix Configuration界面选择No configuration (Install mail command, select No configuration in the Postfix Configuration interface)
sudo apt-get install mailutils
# 安装ssmtp (Install ssmtp)
sudo apt install ssmtp
# 安装vim (Install vim)
sudo apt install vim
# 安装jq (Intsll jq)
sudo apt install jq

# 进入网易云或其他邮箱 开启ssmtp，具体操作请百度 (Access Netease Cloud or another email service to enable ssmtp)
https://blog.csdn.net/qq_34345149/article/details/107483029

# 编辑配置文件ssmtp.conf (Edit the ssmtp.conf configuration file)
sudo vim /etc/ssmtp/ssmtp.conf\
按下insert键向ssmtp.conf添加以下内容: (Press the insert key and add the following content to ssmtp.conf:)\
root=1********66@163.com\
mailhub=smtp.163.com:465\
AuthUser=1********66@163.com\
AuthPass=xxxxxxxx # 网易邮箱授权密码 (# Netease email authorization password)\
UseTLS=Yes\
按esc键后按下小写wq，随后按下enter键退出ssmtp.conf文件 (Press the esc key then type lowercase wq, and press the enter key to exit the ssmtp.conf file)

# 编辑配置文件 (Edit the configuration file)
sudo vim /etc/ssmtp/revaliases\
按下insert键向revaliases中添加以下内容 (Press the insert key and add the following content:)\
ltt:1********66@163.com:smtp.163.com:465    #linux系统用户名:邮箱:mailhub (Linux_system_username:email:mailhub)\
按esc键后按下小写wq，随后按下enter键退出revaliases文件 (Press the esc key then type lowercase wq, and press the enter key to exit the revaliases file)

# 进入到check_solutions.sh所在文件夹，右键打开终端，在新打开的终端中执行 (Openning to the folder containing check_solutions.sh, right-click to open a terminal, and execute in the new terminal)
sudo chmod +x check_solutions.sh
# 编辑config.json文件 (Edit the config.json file)
在config.json文件中修改邮箱及机器名称，json中的邮箱与前文配置文件中的邮箱不同。 (Modify the email and machine name in the config.json file, the email in json is different from the email in the previous configuration file.)
# 间隔600s执行脚本，可自行修改，单位为秒 (Execute the script every 600s, can be modified as needed, unit is seconds)
watch -n 600 $(pwd)/check_solutions.sh

# 停止命令 (Stop command)
ctrl+c


