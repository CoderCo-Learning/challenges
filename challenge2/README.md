# Challenge 2 - The broken mysterybox

## Overview

You’ve been given a mystery Linux server that was set up by a junior engineer who’s now disappeared. The system is half-working, misconfigured, insecure and undocumented.

Your job: Diagnose it, fix it, secure it and document everything.

This is not just about running commands—it’s about research, problem-solving and showing your problem-solving and troubleshooting skills in Linux. 

## Objective

- Get the system into a secure, production-ready state

- Restore broken services (NGINX, cron, systemd)

- Fix bad user permissions and SSH config

- Harden the system (UFW, fail2ban, services)

- Show your work clearly your repo. Explanations too

## Setup

Download the setup script and run it:

```bash
curl -sSL https://raw.githubusercontent.com/CoderCo-Learning/challenges/main/challenge2/setup.sh | sudo bash
```

You can run this inside:

- Killercoda.
- A Multipass VM (Ubuntu 22.04)
- VirtualBox
- Or any local/cloud VM

This script intentionally breaks the system. You must fix it.


## Tasks

1. Fix NGINX

- Serve a web page on port 8080 (not 80)

- Index should say: Hello from DevOps!

- NGINX should start on boot

- Fix broken systemd override

2. SSH Hardening

- SSH must work only on port 2222
- Only admin and deployer users should be allowed
- Disable password login — enable key-based auth
- Provide your public key for SSH

3. User & Permissions

- deployer user must:
  - SSH without password
  - Run sudo systemctl restart nginx
  - Read /var/log/* files
  - Add user to correct groups

4. Cron Logging

- Every 5 minutes, system should log uptime to /var/log/uptime.log
- Log must rotate weekly using logrotate

5. Secure the Box

- Enable and configure ufw
  - Allow only: port 2222, 8080, ICMP
- Configure fail2ban to protect SSH
- Disable unused services
- Set correct timezone to UTC

🚫 Rules

- ❌ No ChatGPT / AI tools allowed. Only as a last resort when you're stuck. 
- ✅ You can and should Google, read man pages, official docs
- 📷 Screenshots/logs in the repo to show your workings. 
- 🔍 Your steps should be reproducible and explain your thinking

Deliverables

Submit a public GitHub repo with:

1. README.md

- Step-by-step guide of how you debugged & fixed things
- What tools/logs/commands you used
- What you learned
- Screenshots of working result (curl, systemctl status, etc.)

2. Fixed files:

Any config files you had to create or fix (nginx.conf, systemd unit files, etc.)

3. Reflection (markdown file or in README):

- What was the most challenging part?
- What did you learn from first principles (not just copy-paste)?
- What would you do differently next time?

## Tips

- Use journalctl, systemctl status, nginx -t, sshd -T, ufw status, etc.
- Take your time. This challenge rewards effort over shortcuts

## Resources 

Here are some helpful, **non-AI resources** you should use during the challenge. Don’t rely on ChatGPT or AI — treat this like real-world troubleshooting.

### 🔧 Systemd & Services

- [Systemd basics – DigitalOcean](https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files)
- [Systemd Unit Files – Arch Wiki](https://wiki.archlinux.org/title/systemd#Unit_files)
- [journalctl usage – RedHat](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/sec-viewing_logs_with_journalctl)

---

### 🌐 NGINX

- [NGINX Beginner’s Guide (official)](https://nginx.org/en/docs/beginners_guide.html)
- [How To Configure NGINX using systemd – DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-22-04)
- [Debugging NGINX with `nginx -t` and logs](https://nginx.org/en/docs/syntax.html)

---

### 🔐 SSH Hardening

- [OpenSSH Server Configuration Guide](https://linuxhint.com/openssh_server_configuration_ubuntu/)
- [How To Harden SSH on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-harden-openssh-on-ubuntu-20-04)
- [Using SSH Key Auth – Ubuntu Wiki](https://help.ubuntu.com/community/SSH/OpenSSH/Keys)

---

### 👷 User Permissions & Sudo

- [Add User to Sudoers – Ubuntu](https://phoenixnap.com/kb/how-to-add-user-to-sudo-group-ubuntu)
- [Understanding User Groups – Linuxize](https://linuxize.com/post/how-to-add-user-to-group-in-linux/)
- [visudo safe editing – Ubuntu Manpage](https://manpages.ubuntu.com/manpages/focal/man8/visudo.8.html)

---

### ⏰ Cron Jobs & Logrotate

- [How To Use Cron – Ubuntu Docs](https://help.ubuntu.com/community/CronHowto)
- [Cron Jobs in `/etc/cron.d/` – ServerFault](https://serverfault.com/questions/346924/what-is-the-difference-between-crontab-e-and-etc-cron-d)
- [Logrotate Configuration Guide](https://www.thegeekdiary.com/understanding-logrotate-configuration-file/)
- [How To Use logrotate – Linuxize](https://linuxize.com/post/logrotate-command-in-linux/)

---

### 🛡️ UFW & Fail2Ban

- [UFW Essentials – Ubuntu Docs](https://help.ubuntu.com/community/UFW)
- [Common UFW Rules – DigitalOcean](https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands)
- [Fail2Ban Basics – DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-ubuntu-20-04)

---

### 🕵️ Debugging Tools

- [Troubleshooting systemd services](https://www.freedesktop.org/software/systemd/man/systemd-analyze.html)
- [Basic Linux Debugging Commands](https://opensource.com/article/18/10/troubleshooting-linux)