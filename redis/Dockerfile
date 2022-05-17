FROM envoyproxy/envoy-dev:latest

COPY envoy-conf.yml.template /etc/envoy-conf.yml.template
COPY envoy-ssl-conf.yml.template /etc/envoy-ssl-conf.yml.template
COPY docker-entrypoint.sh /

RUN chmod 500 /docker-entrypoint.sh

RUN apt-get update && \
    apt-get install gettext -y

ENTRYPOINT ["/docker-entrypoint.sh"]