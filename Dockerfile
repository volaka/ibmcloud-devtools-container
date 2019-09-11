FROM ubuntu:latest
LABEL authors="hasan.volaka@ibm.com,mehmet.cakmak@ibm.com"
RUN apt update && \
    apt install -y curl && \
    apt install -y software-properties-common && \
    apt install -y wget && \
    apt-get install -y bash-completion && \
    wget https://ibm.biz/idt-installer && \
    curl -sL https://ibm.biz/idt-installer | bash
RUN echo "source /usr/local/ibmcloud/autocomplete/bash_autocomplete" >> /etc/bash.bashrc
RUN echo "source /usr/share/bash-completion/bash_completion" >> /etc/bash.bashrc
RUN echo "source <(kubectl completion bash)" >> /etc/bash.bashrc
