# IBM Cloud Devtools preinstalled Docker Image

This is a pull and run docker image to use ibmcloud devtools easily.

You can find detailed **ibmcloud** commands through [this link](https://cloud.ibm.com/docs/cli?topic=cloud-cli-getting-started).

## Prerequisites

You need to have [docker](https://docs.docker.com/install/) installed on your machine.

## Running the image

You can copy and paste the following command to run this image and enter inside the container.

```sh
docker run -d -t --name ibmcloud-devtools volaka/ubuntu-with-ibmcloud-devtools
docker exec -it ibmcloud-devtools bash
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
