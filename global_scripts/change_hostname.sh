#! /bin/bash
if [ -z $1 ] 
then
    echo "Please enter the minion id, followed by [ENTER]:"
    read id
else
    id=$1
fi

if [ -z "$id" ]; then
    echo "Id is undefined"
    exit 1
fi

echo id: $id >> /etc/salt/minion
exit 0
