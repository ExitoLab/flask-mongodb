#!/bin/bash 

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install mongodb bitnami/mongodb -f values.yaml