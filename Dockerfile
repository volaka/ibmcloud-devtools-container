FROM centos:8
LABEL authors="hasan.volaka@ibm.com,mehmet.cakmak@ibm.com"
## Install base packages
RUN yum update -y
RUN yum install -y which curl wget bash-completion vim nano git
## Install docker
RUN yum install -y yum-utils device-mapper-persistent-data lvm2
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y docker-ce docker-ce-cli containerd.io --nobest
RUN systemctl enable docker
RUN curl -L https://raw.githubusercontent.com/docker/machine/v0.16.0/contrib/completion/bash/docker-machine.bash -o /etc/bash_completion.d/docker-machine
## Install kubectl
WORKDIR /tmp
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
## Install Helm
ENV HELM_VERSION=3.0.3
RUN curl -O https://get.helm.sh/helm-v${HELM_VERSION}}-linux-amd64.tar.gz
RUN tar -zxvf helm-v3.0.0-linux-amd64.tar.gz
RUN mv linux-amd64/helm /usr/local/bin/helm
## Install IBM Cloud Cli
RUN curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
RUN echo "source /usr/local/ibmcloud/autocomplete/bash_autocomplete" >> /root/.bashrc
## Install IBM Cloud Cli Plugins
RUN ibmcloud plugin install dev
RUN ibmcloud plugin install container-registry
RUN ibmcloud plugin install container-service/kubernetes-service
RUN ibmcloud plugin install cloud-functions
## Install OpenShift Cli
ENV OC_VERSION=v3.11.0
ENV OC_TAG=0cbc58b
RUN wget https://github.com/openshift/origin/releases/download/${OC_VERSION}/openshift-origin-client-tools-${OC_VERSION}-${OC_TAG}-linux-64bit.tar.gz
RUN tar xzf openshift-origin-client-tools-${OC_VERSION}-${OC_TAG}-linux-64bit.tar.gz
RUN cd openshift-origin-client-tools-${OC_VERSION}-${OC_TAG}-linux-64bit
RUN cp openshift-origin-client-tools-${OC_VERSION}-${OC_TAG}-linux-64bit/oc /usr/bin