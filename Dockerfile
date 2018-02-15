FROM lsiobase/alpine:3.7
MAINTAINER aptalca

# environment settings
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2

# install packages
RUN \
 apk add --no-cache \
 	logrotate \
	nano \
	perl-compress-raw-zlib \
	perl-gd \
	perl-html-parser \
	perl-http-cookies \
	perl-json \
	perl-json-maybexs \
	perl-lwp-useragent-determined \
	wget \
	curl \
	perl-lwp-protocol-https && \
 apk add --no-cache \
 	--repository http://nl.alpinelinux.org/alpine/edge/testing \
	perl-json-xs && \

# fix logrotate
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf && \

 # Download zap2xml.pl script
 curl http://fossick.tk/?h=w1i9ga > /config/zap2xml.pl

# copy local files
COPY root/ /

# ports and volumes
VOLUME /config
