#! /bin/bash
# This script will install the minion on the remote, set the master as the first argument and 
# set the id as user defined.

echo "Please enter the master node, followed by [ENTER]:"
read master
echo "Please enter the minion id, followed by [ENTER]:"
read id

if [ -z "$master" ] || [ -z "$id" ]; then
    echo "Failure, either master or id is undefined"
    exit 1
fi

yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest-1.el7.noarch.rpm &&
yum clean expire-cache &&
yum install -y salt-minion &&
sed -i  "s/#master: salt/master: $master/" /etc/salt/minion
echo "id:$id" >> /etc/salt/minion
systemctl restart salt-minion
exit 0
