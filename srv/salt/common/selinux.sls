policycoreutils-python:
  pkg.installed

policycoreutils:
  pkg.installed

selinux_mode:
  selinux.mode:
    - name: disabled
    - require:
      - pkg: policycoreutils
      - pkg: policycoreutils-python

