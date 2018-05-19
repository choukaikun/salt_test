#haproxy_src:
#  git.latest:
#    - name: https://git.haproxy.org/git/haproxy-1.8.git
#    - target: /opt/apps/unix/haproxy-1.8
#    - require:
#      - /opt/apps/unix

https://git.haproxy.org/git/haproxy-1.8.git:
  git.latest:
    - rev: master
    - target: /opt/apps/unix/src/haproxy-1.8
    - require:
      - pkg: git

haproxy_build:
  cmd.run:
    - name: /bin/make TARGET=linux2628 USE_PCRE=1 USE_PCRE_JIT=1 USE_OPENSSL=1 USE_ZLIB=1 USE_SYSTEMD=1
    - cwd: /opt/apps/unix/src/haproxy-1.8
    - creates: /opt/apps/unix/haproxy-1.8/haproxy

haproxy_install:
  cmd.run:
    - name: /bin/make PREFIX=/opt/apps/unix/haproxy install
    - cwd: /opt/apps/unix/src/haproxy-1.8
    - unless: test -x /opt/apps/unix/haproxy/sbin/haproxy

haproxy_systemd_build:
  cmd.run:
    - name: /bin/make PREFIX=/opt/apps/unix/haproxy
    - cwd: /opt/apps/unix/src/haproxy-1.8/contrib/systemd
    - creates: /opt/apps/unix/src/haproxy-1.8/contrib/systemd/haproxy.service
    - require_in:
      - file: /lib/systemd/system/haproxy.service

/etc/haproxy/haproxy.cfg:
  file.copy:
#    - source: salt://files/haproxy.cfg
    - source: /tmp/salt_test/srv/salt/files/haproxy.cfg
