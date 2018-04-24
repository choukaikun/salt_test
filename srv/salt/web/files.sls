move_old_html_dir:
  file.rename:
    - name: /usr/share/nginx/html.orig
    - source: /usr/share/nginx/html
    - require:
      - pkg: nginx

webfiles_download:
  file.managed:
    - name: /tmp/web.zip
    - source: https://s3-us-west-2.amazonaws.com/bradr-s3/web.zip
    - skip_verify: True

webfiles_extract:
  archive.extracted:
    - name: /usr/share/nginx/
    - source: /tmp/web.zip
    - if_missing: /usr/share/nginx/html
    - require:
      - file: /usr/share/nginx/html.orig
