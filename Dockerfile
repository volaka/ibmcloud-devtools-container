FROM ubuntu:latest
LABEL authors="hasan.volaka@ibm.com,mehmet.cakmak@ibm.com"
RUN apt update && \
    apt-get install -y curl software-properties-common bash-completion vim nano && \
    curl -sL https://ibm.biz/idt-installer | bash
RUN echo "source /usr/local/ibmcloud/autocomplete/bash_autocomplete" >> /etc/bash.bashrc
RUN echo "source /usr/share/bash-completion/bash_completion" >> /etc/bash.bashrc
RUN echo "source <(kubectl completion bash)" >> /etc/bash.bashrc
