#!/bin/bash

openssl genrsa -out owncloud.key 2048
openssl req -new -sha256 -key owncloud.key -out owncloud.csr
openssl req -x509 -days 365 -key owncloud.key -in owncloud.csr -out owncloud.crt
