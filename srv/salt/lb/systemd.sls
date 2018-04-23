/lib/systemd/system/haproxy.service:
  file.copy:
    - source: /opt/apps/unix/haproxy-1.8/contrib/systemd/haproxy.service

/etc/tmpfiles.d/haproxy.conf:
  file.managed:
    - contents: d /run/haproxy 2775 haproxy haproxy -

create_runtime_dir:
  cmd.run:
    - name: /bin/systemd-tmpfiles --create
    - require:
      - file: /etc/tmpfiles.d/haproxy.conf
    - creates: /run/haproxy

