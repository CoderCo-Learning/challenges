#!/bin/bash


echo "[*] Running setup..."

useradd deployer
echo "deployer:changeme123" | chpasswd

apt-get update
apt install -y nginx fail2ban ufw curl cron

cat <<EOF > /etc/nginx/sites-available/default
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    index index.html;
    server_name _;
    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

echo "<h1>FIX ME!</h1>" > /var/www/html/index.html


mkdir -p /etc/systemd/system/nginx.service.d/
cat <<EOF > /etc/systemd/system/nginx.service.d/override.conf
[Service]
ExecStart=/usr/sbin/nginx -g 'daemon off;'
EOF

echo "*/5 * * * * root uptime >> /var/log/uptime.log" > /etc/cron.d/uptime-job
chmod 644 /etc/cron.d/uptime-job

sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

ufw allow 80
ufw allow 2222
ufw --force enable


systemctl disable bluetooth
systemctl disable cups
systemctl disable apache2

timedatectl set-timezone UTC

echo "[!] Setup complete – but broken. Your job is to fix it."
