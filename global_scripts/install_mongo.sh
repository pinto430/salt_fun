#!/bin/bash

mongo_repo="/ect/yum.repos.d/mongodb-org-3.2.repo"
if [[ ! -e $mongo_repo ]]; then
touch $mongo_repo;
cat <<EOT >> $mongo_repo
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc
EOT
fi
sudo yum install -y mongodb-org