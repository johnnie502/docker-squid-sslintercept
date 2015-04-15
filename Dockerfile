FROM ubuntu:14.04

ADD debs /debs/
RUN apt-get install -y  squid3
RUN dpkg -i --force-depends /debs/*.deb
RUN /usr/lib/squid3/ssl_crtd -c -s /var/lib/ssl_db
RUN chown  -R proxy:proxy  /var/lib/ssl_db

EXPOSE 3128
ADD squidconf /squidconf/

CMD /usr/sbin/squid3 -f /squidconf/squid.conf  -NYC -d5