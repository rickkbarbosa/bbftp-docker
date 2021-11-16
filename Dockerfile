FROM ubuntu:12.04
LABEL "Maintainer"="Ricardo Barbosa"
LABEL "e-mail"="rickbkarbosa@live.com"
LABEL "version"="0.0.1"

RUN sed -i 's/archive/old-releases/g' /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y build-essential wget libcrypto++-dev libcrypto++-dev libcrypto++9 libcrypto++-dev libcrypto++-utils libgcrypt11-dev libgcrypt-dev openssl libssl-dev libssl1.0.0

RUN wget http://software.in2p3.fr/bbftp/dist/bbftp-server-3.2.1.tar.gz \
    -O /tmp/bbftp-server.tar.gz

RUN wget http://software.in2p3.fr/bbftp/dist/bbftp-client-3.2.1.tar.gz \
    -O /tmp/bbftp-client.tar.gz

RUN tar xfz /tmp/bbftp-server.tar.gz -C /opt/
RUN sed -i '1i #include <stdio.h>' /opt/bbftp-server-3.2.1/bbftpd/bbftpd_list.c  && \
    cd /opt/bbftp-server-3.2.1/bbftpd ; ./configure && make && make install

RUN tar xvfz /tmp/bbftp-client.tar.gz -C /opt/
RUN sed -i '1i #include <stdio.h>' /opt/bbftp-client-3.2.1/bbftpc/bbftp_list.c  && \
    cd /opt/bbftp-client-3.2.1/bbftpc ; ./configure && make && make install

RUN rm -rf /opt/bbftp-*

RUN echo "root:123456789" | chpasswd

RUN /usr/local/etc/bbftpd start

EXPOSE 5021

CMD ["tail","-f","/dev/null"]
