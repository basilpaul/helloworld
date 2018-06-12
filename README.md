# Helloworld
Hello world application deployed on kubernetes. 

# Local Testing
Prerequisites (Please make sure the following are installed to test on your laptop)

1. minikube: brew cask install minikube
2. virtualbox: https://www.virtualbox.org/wiki/Downloads
3. docker: https://docs.docker.com/install/
4. brew install kubectl

Steps to test

1. Make sure minikube is running (minikube start)
2. git clone https://github.com/basilpaul/helloworld.git
3. Change directory to your cloned repo
4. ./local_install.sh (run the install script)

GET

curl $(minikube ip):31310

Healthcheck

curl $(minikube ip):31310/healthcheck

The healthcheck can be used to check database connectivity (in case the app will require it)

# Pipeline - Continuous deployment/delivery
The dev/test pipeline consists of the below steps:

1. Developers commit their changes o local branches.
2. They perform tests and local deployment using minikube
3. Once the changes have been reviewed, the branch is merged to release branch
4. The automated deployment pipeline will be configured to spin up EKS clusters in AWS and deploy the app in an integration environment
5. Automated tests will run here
6. A conitnuous delivery (user intervention) or contnuous deployment (fully automated) can be used to promote to production


# Production Hosting
Steps to create production cluster

1. Create EKS Master cluster - VPC, role, security group, master
2. Create Nodes - VPC, security group, autoscaling group
3. Use kubectl to deploy the app
Reference: https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html