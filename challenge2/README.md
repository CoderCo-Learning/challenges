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
- ✅ You can and should Google, read man pages, official docs. Please please i don't wanna see AI everywhere and especially the comments. If you use it, make sure to justify and show you understand what you did. 
- 📷 Screenshots/logs in the repo to show your workings. 
- 🔍 Your steps should be reproducible and explain your thinking

Deliverables

Submit a public GitHub repo with:

1. README.md

- Step-by-step guide of how you debugged & fixed things. Screenshots would be nice tbh. 
- What tools/logs/commands you used
- What you learned
- Screenshots of working result (curl, systemctl status, etc.)

2. Fixed files:

Any config files you had to create or fix (nginx.conf, systemd unit files, etc.)

## Tips

- Use journalctl, systemctl status, nginx -t, sshd -T, ufw status, etc.
- Take your time. This challenge rewards effort over shortcuts

## Resources 

Here are some helpful, **non-AI resources** you should use during the challenge. Don’t rely on ChatGPT or AI — treat this like real-world troubleshooting.


- [Systemd basics – DigitalOcean](https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files)
- [Systemd Unit Files – Arch Wiki](https://wiki.archlinux.org/title/systemd#Unit_files)
- [NGINX Beginner’s Guide (official)](https://nginx.org/en/docs/beginners_guide.html)
- [Debugging NGINX with `nginx -t` and logs](https://nginx.org/en/docs/syntax.html)
- [LinuxHint - really good blog to learn hands-on Linux ](https://linuxhint.com/)
- [How To Harden SSH on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-harden-openssh-on-ubuntu-20-04)
- [Using SSH Key Auth – Ubuntu Wiki](https://help.ubuntu.com/community/SSH/OpenSSH/Keys)
- [Understanding User Groups – Linuxize](https://linuxize.com/post/how-to-add-user-to-group-in-linux/)
- [visudo safe editing – Ubuntu Manpage](https://manpages.ubuntu.com/manpages/focal/man8/visudo.8.html)
- [How To Use Cron – Ubuntu Docs](https://help.ubuntu.com/community/CronHowto)
- [UFW Essentials – Ubuntu Docs](https://help.ubuntu.com/community/UFW)
- [Common UFW Rules – DigitalOcean](https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands)
- [Fail2Ban Basics – DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-ubuntu-20-04)
- [Troubleshooting systemd services](https://www.freedesktop.org/software/systemd/man/systemd-analyze.html)