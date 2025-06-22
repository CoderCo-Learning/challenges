# Challenge 1

Scenario:

You're the new DevOps hire at a startup. They've given you a fresh Linux VM and asked you to build a production-ready Linux service setup for their Python app. But there’s no infra — you have to do it all.

Challenge Requirements:

You must create a setup.sh (or Makefile) that does all of the following:

## 1. User & Permissions

- Create a user called appuser (non-root) [Creating a User on the Linux module](https://www.skool.com/coderco/classroom/ec5f8606?md=5bef9bc142884deea36ad361bddf8850)
- Create a directory /opt/coderco-app [Creating directories](https://www.skool.com/coderco/classroom/ec5f8606?md=ffeb37709c8d479c9e1da3759b54a27c)
- Place a server.py file in it (can be a simple http.server)
- Give appuser full access to /opt/coderco-app only - [Setting Permissions](https://www.skool.com/coderco/classroom/ec5f8606?md=df65ef6a3d48437cae6747019d77d8dd)
- Make sure no other user (except root) can read/write to it

## 2. Systemd Service

For some help: [Creating a Linux service with systemd](https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6)

Create a coderco-app.service under /etc/systemd/system

It should:

- Run python3 /opt/coderco-app/server.py
- Run as appuser
- Restart if it fails
- Enable and start the service
- Show that it’s running using curl localhost:<port>

## 3. Logging

- Redirect stdout and stderr to /var/log/coderco-app.log
- Make sure log file has correct ownership and rotates properly (bonus if they use logrotate.d)

## 4. Automation

Write a single setup.sh or Makefile that:

- Creates user
- Creates the app directory
- Adds the Python script
- Configures systemd
- Starts and enables the service
- Verifies the service is up

## Bonus (Not Scored, but if you want to go above and beyond!)

- Add a firewall rule to allow only local access to the port (e.g. ufw or iptables)
- Add a simple healthcheck script and a cronjob for it
- Use env file to pass PORT and LOG_PATH to the Python app
