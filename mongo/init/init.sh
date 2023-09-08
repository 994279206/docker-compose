#!/usr/bin/env bash
echo "Creating mongo users..."
mongo admin --host localhost -u root -p 123456 --eval "db.createUser({user: 'admin', pwd: '123456', roles: [{role: 'userAdminAnyDatabase', db: 'admin'}]});"
mongo admin -u root -p 123456 << EOF
use datagrand
db.createUser({user: 'root', pwd: '123456', roles:[{role:'readWrite',db:'datagrand'}]})
EOF
echo "Mongo users created."
