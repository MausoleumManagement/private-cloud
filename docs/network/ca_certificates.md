
### CA Stuff


For CLI stuff
```
k -n  cert-manager get secret root-secret -o jsonpath='{.data.ca\.crt}' | base64 -d > /tmp/nekropolis-ca.crt
sudo cp /tmp/nekropolis-ca.crt /usr/local/share/ca-certificates/nekropolis-ca.crt
sudo update-ca-certificates
```


For Chromium, import the certificate using `certutil` as described [here](https://chromium.googlesource.com/chromium/src/+/master/docs/linux/cert_management.md)

```
sudo apt install libnss3-tools
certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -n nekropolis-k8s-selfsigned-ca -i /tmp/nekropolis-ca.crt
```


For firefox, install the certificate via the settings menu

```
Certificates > View Certificates ... > Authorities > Import ...
```