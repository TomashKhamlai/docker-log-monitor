FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV LOGS_HOME=/container-logs

RUN /bin/bash -c 'mkdir /container-logs;'
RUN apt-get update \
	&& apt-get install -y --no-install-recommends apt-utils  2>&1 | \
    grep -v "^debconf: delaying package configuration, since apt-utils.*"\
	&& apt-get install -y --no-install-recommends \
	inotify-tools \
	curl \
	jq \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD watcher.sh /

CMD ["/watcher.sh"]
