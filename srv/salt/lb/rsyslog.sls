/etc/rsyslog.d/49-haproxy.conf:
  file.managed:
    - contents:
      - # Create an additional socket in haproxy's chroot in order to allow logging via
      - # /dev/log to chroot'ed HAProxy processes
      - $AddUnixListenSocket /var/lib/haproxy/dev/log
      -  
      - # Send HAProxy messages to a dedicated logfile
      - if $programname startswith 'haproxy' then /var/log/haproxy.log
#      - &~

    - require:
      - file: /var/lib/haproxy/dev

rsyslog:
  service.running:
    - watch:
      - file: /etc/rsyslog.d/49-haproxy.conf
