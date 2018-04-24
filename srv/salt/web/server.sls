web_config_port_1:
  file.replace:
    - name: /etc/nginx/nginx.conf
    - pattern: 80 d
    - repl: 8080 d
    - require:
      - pkg: nginx

#web_config_port_2:
#  file.replace:
#    - name: /etc/nginx/nginx.conf
#    - pattern: :80 d
#    - repl: :8080 d

webserver_service:
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watches:
      - file: /etc/nginx/nginx.conf
