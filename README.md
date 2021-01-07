# gke_hello_world project

**********************************************GKE cluster creation pre-requisites ***************************

Step1: Create a free GCP account
Step2: Google Cloud project--> Created project=eclipx-demo-project
Step3: Install Google Cloud SDK CLI
		
	a) Python version:
		Issues: Incorrect Python version on mac
		Resolution: 
		brew remove python
		remove cache 
		brew install python
		python -V gives the version

	b) ./google-cloud-sdk/install.sh
	c) ./google-cloud-sdk/bin/gcloud init

Step3: Terraform CLI
		https://www.terraform.io/downloads.html

Step4: Create Terraform account
		https://app.terraform.io/signup/account

Step5: Create new Terraform Orgnanisation --> /Workspace-Rajesh

Step6: Create new Workspaces for cluster and app-> with or without VCS connections
		gke_cluster
		kubernetes_app

Step7: To disable remote execution for a workspace, change its execution mode to "Local"

Step8: Local docker installation

Step9: Docker hub account

Step10: Terraform code for cluster and app

********************************************** END **********************************************************

**********************************************GCP project creds *********************************************

Step1: Create service account and grant access for Kubernetes Engine , GCP admin roles

Step2: Copy the json to use in terraform(variable.tf)

		example: 
		
		variable "credentials" {
  		default = "/Users/<<user>>/GCP/Hello-World-Project-0febc2df3286.json"
								}

********************************************** END **********************************************************


**********************************************Terraform commands**********************************************

Step1: Traverse to the folder of terraform code
		cd /gke_cluster
		terraform init
		terraform plan
		terrafrom apply

Note: Attached is the console-  eclipx-dev cluster is created under project 'eclipx-demo-project'

3 nodes have been created

Verify the cluster resource manually using below commands:

	kubectl get nodes


***********************************************END************************************************************



**********************************************Docker build steps**********************************************

Step 1: Create multi stage build Dockerfile with below details

		#Build Stage 1

		FROM node:12 AS appbuild
		WORKDIR /usr/src/app
		COPY package*.json ./
		RUN npm install
		COPY . .

		#Build Stage 2

		FROM node:12
		WORKDIR /usr/src/app
		COPY --from=appbuild /usr/src/app/ /usr/src/app/
		EXPOSE 5000
		CMD [ "node", "server.js" ]
		

Step 2: Docker build
		docker build -t jayarar3/hello-world-app -t jayarar3/hello-world-app:latest .

Step 3: Docker run to test locally, expose it on the available ports

		docker run --rm -p 8080:8080 hello-world-app:latest

Step 4:	curl localhost:8080

********************************************** END **********************************************************

**********************************************Docker push steps**********************************************

Step1 : Docker login with the credentials

		docker login

Step2:  Push the image to docker hub
		docker push jayarar3/hello-world-app

********************************************** END **********************************************************

**********************************************Terraform commands**********************************************

Step1: Traverse to the folder of terraform code
		cd /gke_kube_app
		terraform init
		terraform plan
		terrafrom apply

Output:

gke_cluster = eclipx-dev
endpoint = *****

Verify the cluster resource manually using below commands:

kubectl get deployments
kubectl get svc
kubectl get endpoints
***********************************************END************************************************************










