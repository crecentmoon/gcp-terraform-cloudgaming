.PHONY: init plan apply start stop terminate

init:
	terraform init

plan:
	terraform plan --var-file=local.tfvars

apply:
	terraform apply --var-file=local.tfvars

start:
	gcloud compute instances start game-server\ --zone=asia-northeast1-a

stop:
	gcloud compute instances stop game-server\ --zone=asia-northeast1-a

terminate:
	gcloud compute instances delete game-server\ --zone=asia-northeast1-a