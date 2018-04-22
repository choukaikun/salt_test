#!/usr/bin/env bash

yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm
yum clean expire-cache\
yum install -y salt salt-minion
