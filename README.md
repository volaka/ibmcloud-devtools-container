# IBM Cloud Devtools preinstalled Docker Image

This is a pull and run docker image to use ibmcloud devtools easily.

You can find detailed **ibmcloud** commands through [this link](https://cloud.ibm.com/docs/cli?topic=cloud-cli-getting-started).

## Prerequisites

You need to have [docker](https://docs.docker.com/install/) installed on your machine.

## Running the image

You can copy and paste the following command to run this image and enter inside the container. This container wont remove itself if you exit it intentionally or by mistake. 

```sh
docker run -d -t --name ibmcloud-devtools volaka/ubuntu-with-ibmcloud-devtools
docker exec -it ibmcloud-devtools bash
```

To use docker inside this container (Docker in Docker / DinD) you have to bind your docker socket with this container. By doing that, you will access all of the docker images and containers which had been run inside the container. You can bind the socket wiht the following code:

```sh
docker run -d -t -v /var/run/docker.sock:/var/run/docker.sock --name ibmcloud-devtools volaka/ubuntu-with-ibmcloud-devtools
docker exec -it ibmcloud-devtools bash
```
If you want to access to your current directory path in this container and use docker inside, you can use the following commands:

```sh
docker run -d -t -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD":/root/my-pc --name ibmcloud-devtools volaka/ubuntu-with-ibmcloud-devtools
docker exec -it ibmcloud-devtools bash
cd /root/my-pc
ls -al
```


## Connecting to IBM Cloud

Enter the login command:

```sh
ibmcloud login -a cloud.ibm.com
```

Then, you should follow the instructions to target **resource group**, **organisation** and **space**.

## Support

All feedbacks, requests and helps for making this image better are welcomed.

[<img src="https://cdn3.iconfinder.com/data/icons/social-network-30/512/social-08-512.png" alt="IBM Cloud Turkey Developer Group" width="80px"/>](ibm.biz/trdevexmeetup)
