# Introduction

Dockerfile to build a TUPA DNS container image.

## Version

Current Version: **0.1 - 157b97d**

# Quick Start

You can launch the image using the docker command line,

```bash
mkdir -p /opt/mysql-tupa-dns/data
docker run -d \
--name mysql-tupa-dns \
-e MYSQL_ROOT_PASSWORD=MySuperSecretSqlPassword \
-e MYSQL_DATABASE=tupa \
-e MYSQL_USER=tupa \
-e MYSQL_PASSWORD=AnotherSecretPassword \
-v /opt/mysql-tupa-dns/data:/var/lib/mysql \
mysql:5,5


docker run -d \
--name tupa-dns \
-e TUPA_INSTALLER_PASSWORD=tupainstall \
-p 10080:80 \
--link mysql-tupa-dns:mysql \
visol/tupa-dns:0.1.1
```

Point your browser to `http://localhost:10080/installer/` and login with the defined password:

* password: **tupainstall**

A wizard will guide you through the installation of the database and will set up your admin user.

## References
  * http://www.tupa-dns.org/
  * https://github.com/visol/tupa-dns/
