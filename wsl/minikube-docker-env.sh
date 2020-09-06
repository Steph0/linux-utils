#!/bin/bash
TARGET_FILE=~/.kube/eval-minikube-env

minikube docker-env | grep "SET" > $TARGET_FILE
sed -i 's/SET/export/g' $TARGET_FILE
CERT_WIN_PATH=$(cat $TARGET_FILE| grep "CERT_PATH"| sed 's/.*=\(.*\)/\1/')
CERT_LINUX_PATH=$(wslpath -u "$CERT_WIN_PATH")
sed -i "s,^\(.*CERT_PATH=\)\(.*\)$,\1${CERT_LINUX_PATH}," $TARGET_FILE

