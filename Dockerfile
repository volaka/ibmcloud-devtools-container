FROM ubuntu:latest
LABEL authors="hasan.volaka@ibm.com,mehmet.cakmak@ibm.com"
RUN apt update && \
    apt install -y curl && \
    apt install -y software-properties-common && \
    apt install -y wget && \
    wget https://ibm.biz/idt-installer && \
    curl -sL https://ibm.biz/idt-installer | bash
