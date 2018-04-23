epel_repo:

#  pkg.installed:
#    - sources:
#      - epel-release-latest-7: http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

  cmd.run:
    - name: rpm -i http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    - creates: /etc/yum.repos.d/epel.repo


