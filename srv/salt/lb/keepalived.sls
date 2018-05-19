https://github.com/acassen/keepalived:
  git.latest:
    - rev: master
    - target: /opt/apps/unix/src/keepalived
    - require:
      - pkg: git

keepalived_configure:
  cmd.run:
    - name: configure --prefix=/opt/apps/unix/keepalived && autoreconf -f -i
    - cwd: /opt/apps/unix/src/keepalived
#    - creates: /opt/apps/unix/keepalived/sbin/keepalived

keepalived_build:
  cmd.run:
    - name: /bin/make
    - cwd: /opt/apps/unix/src/keepalived
#    - creates: /opt/apps/unix/src/keepalived/sbin/keepalived

haproxy_install:
  cmd.run:
    - name: /bin/make install
    - cwd: /opt/apps/unix/src/keepalived
    - unless: test -x /opt/apps/unix/keepalived/sbin/keepalived

#/etc/haproxy/haproxy.cfg:
#  file.copy:
#    - source: salt://files/haproxy.cfg
#    - source: /tmp/salt_test/srv/salt/files/haproxy.cfg
