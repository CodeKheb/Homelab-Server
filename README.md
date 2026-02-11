# Homelab-Server
**Kherbin's** personal homeserver using nextcloud because why not?


## Personal Homelab server 
- Nextcloud web app
- MariaDB database
- Works with Android, Laptop, PC using Tailscale
- Wake-on-LAN support
- Own Data Storage
- For reproduction

## Prerequisites 
- Main Server (PC or Laptop)
- Operating System: Arch Linux
- Extra Storage for Cloud
- Wake-on-LAN supported Motherboard (Optional)
> I personally recommend getting a Raspberry Pi for remote SSH Wake-on-Lan or any always on device. Even an old laptop could work :>> 

## Why?
With all the microservices they've been feeding us lately from 
- Limited Cloud Storage
- A.I. Bloat
- Spyware
  
I wanted to host my own Server that I can run locally. Every software I utilized is free and opensource. 

## Repo Structure
``` bash
├── scripts/
│├── install.sh
│├── start.sh
├── .gitignore
├── README.md
├── docker-compose.yaml

```

## Setup Instructions

### 1. Clone this repo
```bash
git clone https://github.com/CodeKheb/Homelab-server.git
cd Homelab-server
```
### 2. Edit the docker-compose.yml file
Change
- SQL Password in MariaDB
```nano
nano docker-compose.yml
```
or
```vim
vim docker-compose.yml
```
```yml
services:
  db:
    image: mariadb:10.11
    container_name: nextcloud-db
    restart: always
    command: --transaction-isolation=READ-COMMITTED --binlog-format=ROW
    environment:
      MYSQL_ROOT_PASSWORD: rootpass123   # change this for access to root    
      MYSQL_DATABASE: nextcloud
      MYSQL_USER: yourUsername123             # change your SQL username 
      MYSQL_PASSWORD: whateverPassword123          # change this to your strong password
    volumes:
      - db_data:/var/lib/mysql

  app:
    image: nextcloud
    container_name: nextcloud-app
    ports:
      - 8080:80               # change this to whatever local port you want e.g 8090:80 -> this will be used for access to nextcloud. Tailwind IP + local port
    restart: always
    links:
      - db
    environment:
      MYSQL_HOST: db
      MYSQL_DATABASE: nextcloud
      MYSQL_USER: yourUsername123      # change your username 
      MYSQL_PASSWORD: whateverPassword123 # change this to your strong password
    volumes:
      - ./data:/var/www/html

volumes:
  db_data:

```
### 3. Install Scripts
``` bash
bash scripts/install.sh
```
- Installs Docker, Docker Compose, and Tailscale
- Makes data folders
### 4. Start The Server
``` bash
bash scripts/start.sh
```
## Setup Tailscale on Your devices
### 5. Setup Tailscale on your Main Server
  
Enable Tailscale
``` bash
sudo systemctl enabled --now tailscaled
```
Authenticate and Login
``` bash
sudo tailscale up
```
Check IP 
``` bash
tailscale ip -4
```
> Copy this IP for this will be important for nextcloud later


### 6. Set-up other PC or laptop

To backup your other files from your other Computers, you can install tailscale as well

> If you haven't installed tailscale with the script

Arch Linux
``` bash
sudo pacman -S tailscale
```
You need to use ``` curl ``` for most other Linux Distros

> Tailscale is not available in most default repos

Enable Tailscale
``` bash
sudo systemctl enabled --now tailscaled
```
Authenticate and Login
``` bash
sudo tailscale up
```

 > ## You should be able to see every devices connected including your Main Server by visiting: [Tailscale](https://login.tailscale.com/admin/machines)

### 7. Install Tailscale on Playstore

1. Install Tailscale on Playstore
2. Login with your preferred account
> I personally use a google account
3. Login with same account used in your Main Server
> This should automatically connect you to your own VPN
You should see:
``` bash
├── Main Server Name
├── Android Phone Name
```


> TO BE CONTINUED
