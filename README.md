# Solution 1


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

GET (The app is accessible at node port 31310)

curl $(minikube ip):31310

Healthcheck

curl $(minikube ip):31310/healthcheck

The healthcheck can be used to check database connectivity (in case the app will require it)

# Pipeline - Continuous deployment/delivery
The dev/test pipeline consists of the below steps:

1. Developers commit their changes to local branches.
2. They perform tests and local deployment using minikube
3. Once the changes have been reviewed, the branch is merged to release branch
4. The automated deployment pipeline will be configured to deploy the app to EKS in an integration environment
5. Automated tests will run here
6. A continuous delivery (user intervention) or contnuous deployment (fully automated) can be used to promote to production


# Production Hosting
Steps to create production cluster

1. Create EKS Master cluster - VPC, role, security group, master
2. Create Nodes - VPC, security group, autoscaling group
3. Configure kubectl to deploy the app to EKS


# Solution 2

# Helloworld
Hello world application deployed using chef

# Local Testing
Prerequisites (Please make sure the following are installed to test on your laptop)

1. Install Vagrant: https://www.vagrantup.com/downloads.html
2. Install Virtualbox:  https://www.virtualbox.org/wiki/Downloads
3. Install ruby and RVM to manage ruby versions

# Steps to converge
4. cd /hello_chef
5. gem install bundler
6. bundle install
7. berks install
8. Unit tests: bundle exec rspec
9. Integration tests: bundle exec kitchen verify
10. Converge: bundle exec kitchen converge
11. The app will be availabe on port 5000 and it can be port forwarded to the laptop using the virtualbox settings

GET

curl localhost:5000

Healthcheck

curl localhost:5000/healthcheck

# Deployments
Deployments can be performed by using chef_client talking to chef server hosting the cookbook.
Additionally push jobs can be used to invoke the chef client


