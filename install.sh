#!/bin/bash

echo "Setting up hello app.."
echo
eval $(minikube docker-env)
echo "Building docker image of app.."
cd app/
docker build -t helloworld:1.0 .
kubectl apply -f hello-deployment.yaml
kubectl apply -f hello-service.yaml
cd ..
echo "Setting up nginx.."
echo
echo "Building docker image of nginx.."
cd proxy/
docker build -t nginx:1.0 .
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
echo "App deployed to a single cluster and is ready for use.."
echo "Use this url - curl $(minikube ip):31310"