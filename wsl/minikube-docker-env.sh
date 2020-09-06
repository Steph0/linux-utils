#!/bin/bash
RESULT=$(minikube docker-env |grep "SET")
RESULT=$(echo $RESULT | sed 's/SET/export/')
CERT_WIN_PATH=$(echo $RESULT| grep "CERT_PATH"| sed 's/.*=\(.*\)/\1/')
CERT_LINUX_PATH=$(wslpath -u "$CERT_WIN_PATH")
RESULT=$(echo $RESULT | sed "s,^\(.*CERT_PATH=\)\(.*\)$,\1${CERT_LINUX_PATH},")

eval $(echo $RESULT)
