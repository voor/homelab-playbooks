#!/usr/bin/env sh

# Concat together both private keys.
cat .secrets/privkey.pem .secrets/cert.pem > .secrets/server.pem
# Send it over to the server.
scp .secrets/server.pem voor@router.planetvoor.com:/etc/lighttpd/server.pem

openssl pkcs12 -export -in .secrets/fullchain.pem -inkey .secrets/privkey.pem -certfile .secrets/cert.pem -out .secrets/unifi.p12 -name unifi -password pass:aircontrolenterprise

keytool -importkeystore -srckeystore .secrets/unifi.p12 -srcstoretype PKCS12 -srcstorepass aircontrolenterprise -destkeystore .secrets/unifi.keystore.jks -storepass aircontrolenterprise

cp .secrets/cert.pem .secrets/cloudkey.crt && \
  cp .secrets/privkey.pem .secrets/cloudkey.key

pushd .secrets && \
  tar cf cert.tar cloudkey.crt cloudkey.key unifi.keystore.jks && \
  popd

scp .secrets/cert.tar root@unifi.planetvoor.com:/etc/ssl/private

# Verify:
# keytool -list -v -keystore .secrets/unifi.keystore.jks
#

# Do this on the router:
# kill -SIGINT $(cat /var/run/lighttpd.pid)
# /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf

# Do this on the cloud key:
# cd /etc/ssl/private/
# tar xf cert.tar
# chown root:ssl-cert cloudkey.crt cloudkey.key unifi.keystore.jks cert.tar
# chmod 640 cloudkey.crt cloudkey.key unifi.keystore.jks cert.tar
# nginx -t
# /etc/init.d/nginx restart; /etc/init.d/unifi restart
