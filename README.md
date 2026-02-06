# Homelab-Server
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
=======
>>>>>>> Stashed changes
<<<<<<< HEAD
Kherbin's personal homeserver using nextcloud
## Personal Homelab server 
- Nextcloud web app
- MariaDB database
- Works with Android, Laptop, PC using Tailscale

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
      MYSQL_ROOT_PASSWORD: rootpass123   # change this to your strong password
      MYSQL_DATABASE: nextcloud
      MYSQL_USER: nextclouduser
      MYSQL_PASSWORD: ncpass123          # change this to your strong password
    volumes:
      - db_data:/var/lib/mysql

  app:
    image: nextcloud
    container_name: nextcloud-app
    ports:
      - 8081:80               # change this to whatever local port you want
    restart: always
    links:
      - db
    environment:
      MYSQL_HOST: db
      MYSQL_DATABASE: nextcloud
      MYSQL_USER: nextclouduser
      MYSQL_PASSWORD: ncpass123 # change this to your strong password
    volumes:
      - ./data:/var/www/html

volumes:
  db_data:

```
=======
>>>>>>> 8aa79eb (Added install scripts)
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes

