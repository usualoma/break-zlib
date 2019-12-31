FROM centos:7

RUN set -ex \
  \
  && yum localinstall -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm \
  && yum install -y gdb gcc make \
                    mysql-community-libs-compat mysql-community-devel \
                    perl-DBD-MySQL perl-Compress-Raw-Zlib ImageMagick-perl \
                    zlib-devel

Add test.png .
