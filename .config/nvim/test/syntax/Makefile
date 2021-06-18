#==============================================================================
#
# Makefile for building Docker images and pushing them to AWS ECR registries.
#
# Current configuration has static js files built by webpack and served with
# by express over the /app route, api is mounted on /api to handle graphql
# requests (/api/graphql) and websocket connections (/api/stream).
#
#  To include descriptions of variables ortargets in the helpfile, use this form:
# "##@CategoryName Description of target purpose"
#
#==============================================================================

# App and docker image identity
APP           := api-admin
VERSION       := $(shell cat package.json | jq .version -r)
IMAGE_NAME    := spadash/$(APP)
DOCKER_FILE   ?= ./infra/docker/Dockerfile
DOCKER_TARGET ?= prod-server
TAG           ?= $(VERSION)

# Set ECR image push configuration.
AWS_ACCOUNT = 414719454744
ECR_REGION ?= us-east-2
ECR_REPO = $(AWS_ACCOUNT).dkr.ecr.$(ECR_REGION).amazonaws.com

# get awscli version to perform correct commands
AWSCLI_VERSION = $(shell aws --version | grep -o '^aws-cli\/.')
ifeq ($(AWSCLI_VERSION),aws-cli/2)
  AWSCLI_VERSION=2
else
  AWSCLI_VERSION=1
endif

#==============================================================================
# Define help targets with descriptions provided in trailing `##` comments.
#
# Note that the '## description' is used in generating documentation when 'make'
# is invoked with no arguments.
#==============================================================================

.PHONY: help

help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

#==============================================================================
# Create AWS ECR login command based on AWS cli version
#==============================================================================

ifeq ($(AWSCLI_VERSION),1)
  ECR_LOGIN_CMD := 'eval $$\( aws ecr'
else
  ECR_LOGIN_CMD := 'aws ecr get-login-password'
endif

ifdef AWS_ECR_PROFILE
  ECR_LOGIN_CMD += ' --profile $(AWS_ECR_PROFILE)'
endif
ifdef ECR_REGION
  ECR_LOGIN_CMD += ' --region $(ECR_REGION)'
endif

ifeq ($(AWSCLI_VERSION),1)
  ECR_LOGIN_CMD += ' get-login --no-include-email \)'
else
  ECR_LOGIN_CMD += ' | docker login --username AWS --password-stdin $(ECR_REPO)'
endif



MAKEFILE_DIR = $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

DOCKER_RUN_ALPINE = docker run --rm -v $(MAKEFILE_DIR):/opt/app -w /opt/app alpine

#==============================================================================
# Envfile target creation and assignments.
#==============================================================================

all-env: ##@Other Make all env files
all-env: .env

# build env vars to configure build and perform variable substitution in docker-compose
.env:
	$(MAKE) envfile-build
envfile-build:
	$(DOCKER_RUN_ALPINE) cp $(ENV_BUILD) .env

clean-envfiles: ## Remove created envfiles

#==============================================================================
# Container building, tagging and management
#==============================================================================

all-containers: ##@Containers Build, tag and push  and run all containers
all-containers: docker-compose.yml docker-build docker-run push-containers

push-containers: ecr-login ecr-tag ecr-push

docker-compose.yml: ##@Containers Create docker-compose.yml from build configuration
docker-compose.yml: .env

# docker-compose, docker-compose-dev, docker-compose-nginx

docker-build: ##@Containers Build docker image with $TAG (default: latest)
docker-build:
	@echo 'building docker image $(IMAGE_NAME):$(TAG)'
	@echo '(docker file: $(DOCKER_FILE), target: $(DOCKER_TARGET))'
	docker build -f $(DOCKER_FILE) --no-cache --target $(DOCKER_TARGET) -t $(IMAGE_NAME):$(TAG) .

ecr-login: ##@AWS Login to ECR for pushing docker images.
	@echo 'logging in to ECR in region $(ECR_REGION)'
	@eval $(ECR_LOGIN_CMD)

ecr-tag: ##@AWS Tag docker image with with $TAG to ECR repo
ecr-tag: ecr-login
	@echo 'tagging docker image $(IMAGE_NAME):$(TAG) for ECR'
	docker tag $(IMAGE_NAME):$(TAG) $(ECR_REPO)/$(IMAGE_NAME):$(TAG)

ecr-push: ##@AWS Push docker image with $TAG to ECR repo
ecr-push: ecr-login
	@echo 'pushing docker image $(IMAGE_NAME):$(TAG) to ECR'
	docker push $(ECR_REPO)/$(IMAGE_NAME):$(TAG)

#==============================================================================
# Local development task targets
#==============================================================================

##@Containers Build the client static files or initialize webpack
webpack-build: .env.client .env.build
	@echo "Building the static files with webpack and moving to /server/public location"
	npm run build-to-server

#==============================================================================
# Other AWS task targets
#==============================================================================

get-aws-authenticator: ##@AWS Install Linux aws-iam-authenticator app
	@echo 'installing linux aws-iam-authenticator app'
	wget -O aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/aws-iam-authenticator
	chmod +x aws-iam-authenticator
	cp aws-iam-authenticator /usr/local/bin/

kubectl-update-tag: ##@AWS Update Kubernetes Deployment image with kubectl
	@echo 'updating image deployment to $(TAG)'
	echo $(KUBECONFIG) | base64 -d > kubeconfig.yaml
	kubectl --kubeconfig=kubeconfig.yaml --namespace=$(KUBENAMESPACE) set image deployment/$(APP) $(APP)=$(ECR_REPO)/$(IMAGE_NAME):$(TAG)

#==============================================================================
# make docker-build -e ENV_CLIENT=./.env.client
# make docker-build -e ENV_BUILD="./.env.build"
