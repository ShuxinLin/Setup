sudo apt-get install -y python-setuptools
sudo easy_install pip
sudo pip install shadowsocks
sudo mkdir /etc/shadowsocks
touch /etc/shadowsocks/config.json
sudo su -c 'curl -L https://raw.githubusercontent.com/ShuxinLin/Setup/master/shadowsocks/ss.config > /etc/shadowsocks/config.json'
sudo ssserver -c /etc/shadowsocks/config.json -d start
