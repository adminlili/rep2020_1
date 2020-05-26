FROM debian:latest

MAINTAINER admin_lili
ENV DEBIAN_FRONTEND=nointeractive

RUN	apt-get update && apt-get upgrade -y && \
	apt-get install -y dnsmasq && \
	rm -rf /etc/dnsmasq.conf
#	service dnsmasq restart
	
COPY dnsmasq.conf /etc/dnsmasq.conf

EXPOSE 1010/tcp
# the ability to stop term with Ctrl+C
STOPSIGNAL SIGTERM
CMD ["/usr/sbin/dnsmasq", "--no-daemon"]
