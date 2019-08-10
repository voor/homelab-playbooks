#!/bin/bash -exu

pushd ${DEHYDRATED_DIR}

./dehydrated --accept-terms -c $@

openssl pkcs12 -export -out certs/lab.planetvoor.com/certificates.pfx -inkey certs/lab.planetvoor.com/privkey.pem -in certs/lab.planetvoor.com/fullchain.pem -passout pass:

SHA_FINGERPRINT=$(openssl x509 -noout -fingerprint -sha1 -inform pem -in certs/lab.planetvoor.com/fullchain.pem | sed -e 's/://g' -e 's/SHA1 Fingerprint=//')

echo "SHA1 Fingerprint: $SHA_FINGERPRINT"

scp certs/lab.planetvoor.com/certificates.pfx 'administrator@dc.lab.planetvoor.com:C:\certificates.pfx'

ssh administrator@dc.lab.planetvoor.com Import-PfxCertificate -FilePath 'c:\certificates.pfx' -CertStoreLocation 'Cert:\LocalMachine\My'

# ssh administrator@dc.lab.planetvoor.com Add-AdfsCertificate -CertificateType "Service-Communications" -Thumbprint $SHA_FINGERPRINT

credhub s -t certificate -n concourse/homelab/pks_tls -c certs/planetvoor.com/fullchain.pem -p certs/planetvoor.com/privkey.pem

kubectx insecure

kubectl create secret -n gitlab-system tls gitlab-ingress --cert=certs/planetvoor.com/fullchain.pem --key=certs/planetvoor.com/privkey.pem --dry-run -o yaml | kubectl replace -f -

kubectl create secret -n concourse-system tls concourse-ingress --cert=certs/planetvoor.com/fullchain.pem --key=certs/planetvoor.com/privkey.pem --dry-run -o yaml | kubectl replace -f -

kubectl create secret -n harbor-system generic harbor-ingress --from-file=ca.crt=certs/planetvoor.com/ca.pem --from-file=tls.crt=certs/planetvoor.com/fullchain.pem --from-file=tls.key=certs/planetvoor.com/privkey.pem -o yaml --dry-run | kubectl replace -f -

kubectl create secret -n ingress-nginx tls default-ssl-certificate --cert=certs/planetvoor.com/fullchain.pem --key=certs/planetvoor.com/privkey.pem --dry-run -o yaml | kubectl replace -f -

kubectl create secret -n default tls build-service-certificate --cert=certs/planetvoor.com/fullchain.pem --key=certs/planetvoor.com/privkey.pem --dry-run -o yaml | kubectl replace -f -

kubectx -
kubectx main

kubectl create secret -n gitlab-system tls gitlab-ingress --cert=certs/apps.planetvoor.com/fullchain.pem --key=certs/apps.planetvoor.com/privkey.pem --dry-run -o yaml | kubectl replace -f -

kubectl create secret -n concourse-system tls concourse-ingress --cert=certs/apps.planetvoor.com/fullchain.pem --key=certs/apps.planetvoor.com/privkey.pem --dry-run -o yaml | kubectl replace -f -

kubectl create secret -n harbor-system generic harbor-ingress --from-file=ca.crt=certs/planetvoor.com/ca.pem --from-file=tls.crt=certs/apps.planetvoor.com/fullchain.pem --from-file=tls.key=certs/apps.planetvoor.com/privkey.pem -o yaml --dry-run | kubectl replace -f -

kubectl create secret -n ingress-nginx tls default-ssl-certificate --cert=certs/apps.planetvoor.com/fullchain.pem --key=certs/apps.planetvoor.com/privkey.pem --dry-run -o yaml | kubectl replace -f -

kubectl create secret -n default tls build-service-certificate --cert=certs/planetvoor.com/fullchain.pem --key=certs/planetvoor.com/privkey.pem --dry-run -o yaml | kubectl replace -f -

kubectx -

popd
pushd ${ANSIBLE_DIR}

ansible-playbook -i hosts.yml rogue.yml -c local

ansible-playbook -i hosts.yml osmc.yml 

ansible-playbook -i hosts.yml  unifi.yml

om -k update-ssl-certificate --certificate-pem "$(cat .secrets/fullchain.pem)" --private-key-pem "$(cat .secrets/privkey.pem)"

popd
