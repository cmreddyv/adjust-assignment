# adjust-assignment

This is a simple TCP Server written in ruby socket programming.

It runs on TCP
port 80. The application also exposes a health check and endpoint at the route /healthcheck

This is a highly available system and load balanced  as it is being deployed on kubernetes which have replicas and services along with HPA and Ingress.


Requirements:
1. Minikube
2. Docker
3. DockerHub
4. Kubectl
5. Jenkins Server for running pipelines

### Install Kubectl

```
brew install kubectl
```

### Install Minikube

```
brew install minikube
```
We successfully setup minikube in our mac now we are good to start minikube

```
minikube start
```
Once minikube started successfully , we can verify its status

```
minikube status
```

Enable metrics add on for minikube for getting the metric for HPA

```
minikube addons enable metrics-server
```

Install Docker using  `https://docs.docker.com/desktop/mac/install/`

clone the git repo

git clone https://github.com/cmreddyv/adjust-assignment.git

Build the docker image using

```
docker build -t <dockerhubusername:/imagename:tag> .
```

Note: run the above command in the local context

once the image is build successfully run the following to push the image to repo

Create the namespace `assignment` using `kubectl create ns assignment`
Note: I have added my local minikube ip. please change it to your minikube ip in the deployment file

getting minikube ip `minikube ip`

```
kubectl create deployment -f deploy.yaml
```
Check the status of the pods using `kubectl get pods -n assignment`

once the status is running

open http://<minikubeip> in the webbrowser


Note: I have added Ingress for the deployment, but minikube is not supporting ingress.. hence kept it as place holder.


## JenkinsFile:
Created Jenkins file with the name Jenkinsfile for creating the pipeline for building and pushing the docker images.