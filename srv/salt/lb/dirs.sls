/etc/haproxy:

  file.directory:
    - user: root
    - group: root
    - dir_mode: 755

/var/lib/haproxy/dev:

  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: True
