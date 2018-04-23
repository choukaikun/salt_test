#!/usr/bin/env bash

yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm
yum clean expire-cache
yum install -y salt salt-minion

cp -p /etc/salt/minion /etc/salt/minion.bkp

cat << EOF > /etc/salt/minion
file_client: local
file_roots:
  base:
    - /tmp/salt_test/srv/salt
EOF

salt-call --id=lb1 state.apply
