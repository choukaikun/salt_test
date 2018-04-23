haproxy_group:
  group.present:
    - name: haproxy
    - gid: 65188

haproxy_user:
  user.present:
    - name: haproxy
    - uid: 65188
    - gid_from_name: True
    - home: /var/lib/haproxy
    - createhome: False
    - shell: /sbin/nologin
    - require:
      - group: haproxy
