FROM debian:latest

MAINTAINER admin_lili
ENV DEBIAN_FRONTEND=nointeractive

COPY /
RUN	apt-get update && apt-get upgrade -y && \
	apt-get install -y dnsmasq && \
	service dnsmasq restart
EXPOSE 53/tcp
# the ability to stop term with Ctrl+C
STOPSIGNAL SIGTERM

CMD ["/usr/sbin/dnsmasq"]
