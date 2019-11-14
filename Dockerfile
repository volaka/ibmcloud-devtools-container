FROM ubuntu:latest
LABEL authors="hasan.volaka@ibm.com,mehmet.cakmak@ibm.com"
RUN apt update && \
    apt-get install -y curl wget software-properties-common bash-completion vim nano && \
    curl -sL https://ibm.biz/idt-installer | bash
ENV OC_VERSION=v3.11.0
ENV OC_TAG=0cbc58b
RUN wget https://github.com/openshift/origin/releases/download/${OC_VERSION}/openshift-origin-client-tools-${OC_VERSION}-${OC_TAG}-linux-64bit.tar.gz && \
    tar xzf openshift-origin-client-tools-${OC_VERSION}-${OC_TAG}-linux-64bit.tar.gz && \
    cd openshift-origin-client-tools-${OC_VERSION}-${OC_TAG}-linux-64bit && \
    cp oc /usr/bin
RUN echo "source /usr/local/ibmcloud/autocomplete/bash_autocomplete" >> /etc/bash.bashrc
RUN echo "source /usr/share/bash-completion/bash_completion" >> /etc/bash.bashrc
RUN echo "source <(kubectl completion bash)" >> /etc/bash.bashrc
