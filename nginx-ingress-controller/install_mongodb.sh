#!/bin/bash 

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install nginx-ingress-controller bitnami/nginx-ingress-controller