# Introduction to Kubernetes - Basic Concept

Kubernetes is a basic building block of the modern application development that is based on DevOps and Cloud-Native Architecture. Moving from a traditional `Monolithic application` development into a `microservices application` development utilizing containers technology is becoming the norm and has been for a while. However, when the number of containers that are hosting your application grow in number to 100's or 1000's or even more, then managing, orchestrating, and automating these containers and their operation tasks is going to be road blocker. This is where Kubernetes comes in the picture.

---

<p align="center">
    <img src="images/IntroPic.png">
</p>

---

## Quick Recap On Microservices, Containers, Cloud Native, & DevOps

> What is Microservices

Microservice architecture is an architectural approach of application development where a traditional application developed all in a single object `Monolithic architecture` is divided into a smaller services that are independent, loosely coupled, each one is serving a single business objective, and can integrate and communicate with each others using an API or equivalent. 

Referring to AWS documentation [_Referenced Below_], `Monolithic vs. Microservices Architecture`; 

- With monolithic architectures, all processes are tightly coupled and run as a single service. This means that if one process of the application experiences a spike in demand, the entire architecture must be scaled. Adding or improving a monolithic application’s features becomes more complex as the code base grows. This complexity limits experimentation and makes it difficult to implement new ideas. Monolithic architectures add risk for application availability because many dependent and tightly coupled processes increase the impact of a single process failure.

- With a microservices architecture, an application is built as independent components that run each application process as a service. These services communicate via a well-defined interface using lightweight APIs. Services are built for business capabilities and each service performs a single function. Because they are independently run, each service can be updated, deployed, and scaled to meet demand for specific functions of an application.


<p align="center">
    <img src="images/MonolithicVsMicroservices.png">
</p>

---

## What is Kubernetes - Overview

Kubernetes is an open-source project build originally by Google in 2014 and later donated to `CNCF` (Cloud Native Computing Foundation) designed to orchestrate, automate and manage containerized applications. The name Kubernetes originates from Greek, meaning helmsman or pilot. K8s as an abbreviation results from counting the eight letters between the "K" and the "s". The official description of kubernetes from the official kubernetes documentation is:

`Kubernetes is a portable, extensible, open source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation. It has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available.`


---

> References:

- [What are Microservices - AWS](https://aws.amazon.com/microservices/)
- [What are Microservices - Google Cloud](https://cloud.google.com/learn/what-is-microservices-architecture)
- [Kubernetes Overview - official Document](https://kubernetes.io/docs/concepts/overview/)
