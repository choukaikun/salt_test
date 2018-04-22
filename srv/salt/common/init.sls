include:
  - common.packages

policycoreutils-python:
  pkg.installed

policycoreutils:
  pkg.installed

wget:
  pkg.installed

#epel_repo:
#  file.managed:
#    - name: /tmp/epel-release-latest-7.noarch.rpm
#    - source: http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
#    - skip_verify: True

epel_repo:
  pkg.installed:
    - sources:
      - epel-release-latest-7: http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

selinux_mode:
  selinux.mode:
    - name: disabled
    - require:
      - pkg: policycoreutils
      - pkg: policycoreutils-python
