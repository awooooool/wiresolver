FROM powerdns/pdns-recursor-52

USER root

RUN apt update && apt install -y dnsutils
RUN rm /etc/powerdns/recursor.conf

COPY etc/powerdns/recursor.yml /etc/powerdns/recursor.yml

USER pdns

HEALTHCHECK CMD ["dig", "+short", "+retry=0", "@127.0.0.1", "||", "exit", "1"]