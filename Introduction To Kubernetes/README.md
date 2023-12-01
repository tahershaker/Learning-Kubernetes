# Introduction to Kubernetes - Basic Concept

Kubernetes is a basic building block of the modern application development that is based on DevOps and Cloud-Native Architecture. Moving from a traditional `Monolithic application` development into a `microservices application` development utilizing containers technology is becoming the norm and has been for a while. However, when the number of containers that are hosting your application grow in number to 100's or 1000's or even more, then managing, orchestrating, and automating these containers and their operation tasks is going to be road blocker. This is where Kubernetes comes in the picture.

---

<p align="center">
    <img src="images/IntroPic.png">
</p>

---

## Quick Recap On Microservices, & Containers

> What is Microservices

Microservice architecture is an architectural approach of application development where a traditional application developed all in a single object `Monolithic architecture` is divided into a smaller services that are independent, loosely coupled, each one is serving a single business objective, and can integrate and communicate with each others using an API or equivalent. 

Referring to AWS documentation [_Referenced Below_], `Monolithic vs. Microservices Architecture`; 

- With monolithic architectures, all processes are tightly coupled and run as a single service. This means that if one process of the application experiences a spike in demand, the entire architecture must be scaled. Adding or improving a monolithic application’s features becomes more complex as the code base grows. This complexity limits experimentation and makes it difficult to implement new ideas. Monolithic architectures add risk for application availability because many dependent and tightly coupled processes increase the impact of a single process failure.

- With a microservices architecture, an application is built as independent components that run each application process as a service. These services communicate via a well-defined interface using lightweight APIs. Services are built for business capabilities and each service performs a single function. Because they are independently run, each service can be updated, deployed, and scaled to meet demand for specific functions of an application.


<p align="center">
    <img src="images/MonolithicVsMicroservices.png">
</p>

> What is Container

Container is a very small and light-weight unit holding a pice of software with all the required dependencies for this software to run properly. A container runs on top of a compute resources (_physical server or virtual machine_) and operating system (_linux and lately windows_). A container is an isolated unit that have no knowledge of the underlying resources or other containers running on the same physical resource. 

Referring to Docker documentation and website [_Referenced Below_], `A Container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.`

Tha basic idea of container came from utilizing several linux features allowing the isolation of the software package to run independently from others. Some of these linux features are [Namespace](https://en.wikipedia.org/wiki/Linux_namespaces), [CGroups](https://en.wikipedia.org/wiki/Cgroups), and [Union Filesystem](https://en.wikipedia.org/wiki/UnionFS)

- __Namespace__: [Process Isolation]: Namespaces are a feature of the Linux kernel that provide isolation for running processes, limiting their access to system resources without the running process being aware of the limitations. Namespace partitions kernel resources such that one set of processes sees one set of resources and another set of processes sees a different set of resources. Within the Linux kernel, there are different types of namespaces. Each namespace has its own unique properties:
  - User namespace: Dedicated set of user and group IDs. A process can have root privilege within its user namespace without having it in other user namespaces.
  - Process ID (PID) namespace assigns a set of PIDs to processes that are independent from the set of PIDs in other namespaces. 
  - Network namespace has an independent network stack: its own private routing table, set of IP addresses, socket listing, connection tracking table, firewall, and other network‑related resources.

- __CGroups__: [Resource Isolation]: A control group (cgroup) is a Linux kernel feature that limits, accounts for, and isolates the resource usage (CPU, memory, disk I/O, network, and so on) of a collection of processes. cgroups are used to control how much of a given key resource (CPU, memory, network, and disk I/O) can be accessed or used by a process or set of processes. 

- __Union Filesystem__: [Filesystem Isolation]: The union filesystem allows the files and directories of separate filesystem, known as layers, to be transparently overlaid to create a new virtual filesystem. While starting a container, container engine overlays all the layers attached to an image and creates a read-only filesystem. On top of that, container engine creates a read/write layer that is used by the container's runtime environment.

To be able to have a better understanding of containers, there are some components that needs to be understood.

- __Container__: A Container is a standardization of a unite that package both app code along with all the required dependencies for this code to run. 

- __Container Image__: A Container Image is a representation of the container and the software the runs within. A container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings. The Container Image is used by the container engine to create and run the container itself. 

- __Container Engine__: A Container engine is the engine the runs one or more isolated instance of container on the same operating system kernel on the same hardware (Container Host). Most modern container engines use the Open Container Initiative (OCI) container image format. A key component of a container engine is the container runtime, which communicates with the operating system kernel to perform the containerization process and configure access and security policies for running containers. Container Engine is also sometimes called Container Runtime. One of the most popular Container Runtime is called Containerd. 

- __Container Host__: A Container Host is simply the system that runs the containerized processes. A Container Host can be a physical bare-metal host or a virtual machine.

- __Container Isolation__: Container utilizes and takes advantages of several Linux operating system feature to provide the isolation required for each container running on the same Host. 3 main features to achieve this are Namespaces, Cgroups, and Union File System

- __Container Image Registry__: A Container Registry is one or more repository that is used to store Container Images. A Container platform/engine (such as Docker) pulls the images from the Container Registry to the Container Host to deploy the containers form the Image. Some of the popular container registries are DockerHub, Amazon ECR, Azure Container Registry, Google Container Registry. A Container Registry can be public or private.

<p align="center">
    <img src="images/ContainerComponents.png">
</p>

Most of the concepts explained for containers, technology have seen it before, especially when it comes to isolation as this is very similar to virtual machines. As a virtual machines perform isolation and virtualizing the underlying physical resource to be able to run multiple operating system and application in the form of a virtual machine, container also perform something similar, __however__ container do not include a full operating system version running inside but rather it only container a very light version with the required libraries and depend on the kernel of the underlying operating system. 

Referring to Docker documentation and website [_Referenced Below_], Container VS Virtual Machine:

- __Virtual machines__ (VMs) are an abstraction of physical hardware turning one server into many servers. The hypervisor allows multiple VMs to run on a single machine. Each VM includes a full copy of an operating system, the application, necessary binaries and libraries – taking up tens of GBs. VMs can also be slow to boot.

- __Containers__ are an abstraction at the app layer that packages code and dependencies together. Multiple containers can run on the same machine and share the OS kernel with other containers, each running as isolated processes in user space. Containers take up less space than VMs (container images are typically tens of MBs in size), can handle more applications and require fewer VMs and Operating systems.

When creating a virtual machine and a container, with virtual machine we install a hypervisor on the physical server and then create a virtual machine which will include a full copy of an operating system and the required applications. Container on the other-hand, we install an operating system (linux/Windows) on a physical server and then install the container requirements such as the container engine (Such as docker or containerd) and then we create the containers. The best approach is to run container ont op of virtual machines

<p align="center">
    <img src="images/ContainerVsVMs.png">
</p>


---

## What is Kubernetes - Overview

Kubernetes is an open-source project build originally by Google in 2014 and later donated to `CNCF` (Cloud Native Computing Foundation) designed to orchestrate, automate and manage containerized applications. The name Kubernetes originates from Greek, meaning helmsman or pilot. K8s as an abbreviation results from counting the eight letters between the "K" and the "s". The official description of kubernetes from the official kubernetes documentation is:

`Kubernetes is a portable, extensible, open source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation. It has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available.`


---

> References:

- [What are Microservices - AWS](https://aws.amazon.com/microservices/)
- [What are Microservices - Google Cloud](https://cloud.google.com/learn/what-is-microservices-architecture)
- [What Are Namespaces and cgroups, and How Do They Work? - NGINX](https://www.nginx.com/blog/what-are-namespaces-cgroups-how-do-they-work/)
- [Kubernetes Overview - official Document](https://kubernetes.io/docs/concepts/overview/)
