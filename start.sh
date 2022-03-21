#!/bin/bash

minikube addons enable ingress

kubectl create -f k8s/ns.yaml
kubectl create -f k8s/simpleapp-cm.yaml
kubectl create -f k8s/simpleapp-svc.yaml
kubectl create -f k8s/challenge-ingress.yaml
kubectl create -f k8s/simpleapp.yaml

CLUSTER_IP=""

while [ -z "$CLUSTER_IP" ]
do
    sleep 10
    CLUSTER_IP=$(kubectl describe ing simpleapp-ing | grep Address | cut -d ":" -f 2 | awk '{$1=$1};1')
done

echo "Acesse: http://${CLUSTER_IP}"
