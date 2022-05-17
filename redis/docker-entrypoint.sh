#!/bin/bash
set -e

echo "Generating envoy.yaml config file..."
cat /etc/envoy-conf.yml.template | envsubst \$ADMIN_PORT,\$LISTEN_PORT,\$PREFIX_STRING,\$REDIS1_HOST,\$REDIS1_PORT,\$REDIS1_AUTH,\$REDIS2_HOST,\$REDIS2_PORT,\$REDIS2_AUTH > /etc/envoy.yaml
cat /etc/envoy-ssl-conf.yml.template | envsubst \$ADMIN_PORT,\$LISTEN_PORT,\$PREFIX_STRING,\$REDIS1_HOST,\$REDIS1_PORT,\$REDIS1_AUTH,\$REDIS2_HOST,\$REDIS2_PORT,\$REDIS2_AUTH > /etc/envoy-ssl.yaml

# commandline args

if [ "$DEBUG" == "1" ]; then
	ARG0="-l trace --component-log-level upstream:debug,connection:trace"
else 
	ARG0="-l info"
fi

if [ "$SSL" == "1" ]; then
	CONF0="/etc/envoy-ssl.yaml"
else 
	CONF0="/etc/envoy.yaml"
fi

echo "Config file to use..."
cat $CONF0
echo ""
echo ""

# commandline args

echo "Starting Envoy..."
CMD0="envoy -c ${CONF0} --concurrency ${CONCURRENCY} ${ARG0}"
echo $CMD0
eval $CMD0