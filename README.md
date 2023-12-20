# Learn Kubernetes From Beginner To Advanced

---

<p align="center">
    <img src="images/IntroPic.png">
</p>

---

---

> Section Intro

Kubernetes is a powerful open-source platform system, initially developed by Google and supported by the Cloud Native Computing Foundation (CNCF), for managing and orchestrating containerized applications in a modern application cloud-native environment. This course is built and designed to help you understand and learn kubernetes and take you from zero-to-little knowledge to a mid-to-advanced level of knowledge and understanding.

---

---

## Course Contents

[1. Introduction To Kubernetes](/1.%20Introduction%20To%20Kubernetes/)

> In this module, we will be covering the basic concept of kubernetes as an introduction point to kubernetes.

`Module Contents:`

- [Containers & Microservices Quick Recap](/1.%20Introduction%20To%20Kubernetes/README.md/#Containers-&-Microservices-Quick-Recap)
  - [What is Container](/1.%20Introduction%20To%20Kubernetes/README.md/#What-is-Container)
  - [Container Components](/1.%20Introduction%20To%20Kubernetes/README.md/#Container-Components)
  - [Container VS Virtual Machines](/1.%20Introduction%20To%20Kubernetes/README.md/#Container-VS-Virtual-Machines)
  - [Container Benefits ](/1.%20Introduction%20To%20Kubernetes/README.md/#Container-Benefits)
  - [What is Microservices](/1.%20Introduction%20To%20Kubernetes/README.md/#What-is-Microservices)
- [Kubernetes](/1.%20Introduction%20To%20Kubernetes/README.md/#Kubernetes)
  - [Kubernetes Basic Introduction - [Core Concept - What is Kubernetes]](/1.%20Introduction%20To%20Kubernetes/README.md/#Kubernetes-Basic-Introduction---[Core-Concept---What-is-Kubernetes])
  - [Kubernetes Features & Benefits - [What Would Kubernetes WILL Provide]](/1.%20Introduction%20To%20Kubernetes/README.md/#Kubernetes-Features-&-Benefits---[What-Would-Kubernetes-WILL-Provide])
  - [Kubernetes Is Not An End-To-End Platform - [What Would Kubernetes WILL NOT Provide]](/1.%20Introduction%20To%20Kubernetes/README.md/#Kubernetes-Is-Not-An-End-To-End-Platform---[What-Would-Kubernetes-WILL-NOT-Provide])
  - [Kubernetes Behind The Scenes - [Core Concept - How Dose Kubernetes Work]](/1.%20Introduction%20To%20Kubernetes/README.md/#Kubernetes-Behind-The-Scenes---[Core-Concept---How-Dose-Kubernetes-Work])

---

[2. Kubernetes Architecture]()

> In this module, we will discuss the components building-blocks, and architecture of a kubernetes cluster and the understanding of the kubernetes high-level picture.

`Module Contents:`

- Introduction To Kubernetes Architecture - [High Level]
- Kubernetes Objects - [High Level]
  - What is a Kubernetes Object
  - Simple Examples Of Kubernetes basic Objects
    - Kubernetes Node - [High Level]
    - Kubernetes Namespace - [High Level]
    - Kubernetes Pods - [High Level]
    - Kubernetes Deployment - [High Level]
    - Kubernetes Services - [High Level]
  - Creating An Object In Kubernetes [Basic Concept] - [Kubectl & YAML Manifest File]
- Kubernetes Components - [Control Plan & Nodes Components]
  - Control Plan Components
    - API Server
    - Controller Manager
    - Scheduler
    - etcd
  - Node Components
    - Kubelet
    - Kube-Proxy
    - Container Runtime
- Additional Kubernetes Components
- Kubernetes Cluster Architecture - [Summary]

---

[3. Kubernetes Cluster High Availability]()

> In this module, we will be discussing how can we achieve high availability in a kubernetes cluster and what are the type of topologies available for a highly available kubernetes cluster.

`Module Contents:`

- Kubernetes Cluster High Availability Concept
- Kubernetes Cluster High Availability Topologies
  - Stacked etcd Kubernetes Cluster
  - External etcd Kubernetes Cluster
  - Stacked High Availability Control Plan Kubernetes Cluster
  - External High Availability Control Plan Kubernetes Cluster

---

[4. Kubernetes Management Tools]()

> In this module, will cover the different management tools to be used with kubernetes for different tasks, this module will only provide a very high-level introduction to the tools and will not go into details of the different tools. Some of the listed tolls will be discuss in more details in a later modules in this course.

`Module Contents:`

- Building Tools
  - Kubeadm
  - kOps
  - kubespray
  - Minikube
- Cluster Management Tools
  - kubectl
  - etcdctl
- Application Management Tools
  - Helm
  - Kompose
  - Kustomize

---

[5. Building A Kubernetes Cluster]()

> In this module, will discuss how to build a kubernetes cluster using one of the management tools we have discussed (kubeadm). As mentioned in a previous module, there are different kubernetes cluster topologies in which some provides high availability to the kubernetes cluster. Thus, in this module, we will have dedicated sub-module providing a step-by-step guide on building a kubernetes cluster and each sub-module will cover a different kubernetes topology that was explained in the previous module.

`Module Contents:`

- Tools Available for Building a Kubernetes Cluster
- Kubeadm Deep-Dive
- Building a Kubernetes Cluster Using Kubeadm 
  - Building A Kubernetes Cluster [Stacked etcd] using kubeadm - Step By Step Guide
  - Building A Kubernetes Cluster [External etcd] using kubeadm - Step By Step Guide
  - Building A High Available Control Plan Kubernetes Cluster [Stacked etcd] using kubeadm - Step By Step Guide
  - Building A High Available Control Plan Kubernetes Cluster [External etcd] using kubeadm - Step By Step Guide

---

[6. YAML Files & Kubectl Deep Dive]()

> In this module, will go into deep details covering the YAML files and formate using to create kubernetes objects in a kubernetes cluster, as well as, the kubectl CLI tool explaining how to install, configure, and use the kubectl tool.
 
`Module Contents:`

- YAML Manifest Files
  - What is a Manifest File
  - What is YAML
  - YAML Manifest File Structure and Formate
  - YAML File Example
- Kubectl
  - What is Kubectl
  - Kubectl Syntax
  - Kubectl Configuration (kubeconfig) File
  - Multiple kubernetes cluster Management with kubectl
    - Using Kubeconfig Context
    - Using KUBECONFIG environment variable
    - Using the --kubeconfig flag command line
  - kubectl Imperative vs Declarative commands
  - List of main kubectl operation commands

---

[7. Kubernetes Application Workloads Objects]()

> In this module, we will be covering the main objects that is used in kubernetes to build your application workloads. There will be several other objects used to support your workload application such as networking and security that will be discussed in a later module of this course. In this module we will be focusing on the main basic objects to build an application such as Namespace, container, Pod, ReplicaSet, Deployment and more.

`Module Contents:`

- Kubernetes Containerized Application
- Basic Kubernetes Object To Run Containerized Application
- Kubernetes Application Workloads Objects 
  - Kubernetes Namespace
  - Kubernetes Container
  - Kubernetes Pod
  - Kubernetes ReplicaSet
  - Kubernetes Deployment
  - Kubernetes StatefulSet
  - Kubernetes Job
  - Kubernetes CronJob

---

[8. Kubernetes Cluster Administration & Management]()

> In this module, We will be covering admin tasks and activities or even tools a kubernetes cluster admin would use to perform Day-2 operations. An example Day-2 operations would be, cluster patching & upgrade, Cluster Authentication, working with certificates, logging and monitoring and much more.

`Module Contents:`

- Administering a Kubernetes Cluster
- Kubernetes Cluster Administrator Tasks & Tools
  - Kubernetes Node Draining and Uncordon 
  - Kubernetes Cluster Patching and Upgrading
  - Kubernetes Node Operating System Patching and Upgrading
  - Kubernetes Cluster Node Scaling
  - Managing and Generating Kubernetes Cluster Certificates
  - Kubernetes Cluster etcd Backup and Restore
  - Kubernetes Cluster Role-Base Access Control [RBAC] - Cluster Authentication & Authorization
  - Kubernetes Cluster and Application Logging and Monitoring
  - Kubernetes Resource Inspections
  - Kubernetes Resource Management - Limits, Reservations, and Quotas
  - Kubernetes Cluster Workload Application Objects Auto-Scaling

----

[9. Kubernetes Application Management]()

> In this module, we will be covering tools, kubernetes object, and activities a kubernetes user would use to manage, maintain, and configure application workloads running in a kubernetes cluster. 

- Kubernetes Application Lifecycle Management
- Kubernetes Application Management Object, Activities, & Tools
  - Kubernetes Labels and Selectors
  - Kubernetes Application Environment Variables
  - Kubernetes Application ConfigMaps
  - Kubernetes Application Secrets
  - Application Rolling Updates and RollBacks
  - Kubernetes Application Self-Healing
  - Kubernetes Application Auto-Scaling
  - Kubernetes Application Scheduling
    - Kubernetes Scheduler 
    - Node Selector & Affinity
    - Taints and Toleration
    - Pod Priority & Preemption
    - Resources Allocation & Dynamic Resource Allocation
    - Kubernetes Scheduling Framework
    - Kubernetes Multiple Schedulers
    - Configuring Scheduler Profiles

---

[10. Kubernetes Networking]()

> In this module, we will discuss networking within a kubernetes cluster in details. Explain the basic concept of kubernetes networking, understand that different Kubernetes CNI available, however, we will be using Calico CNI for our course, explain the different networking object in kubernetes as well as the DNS in kubernetes.

`Module Contents:`

- Kubernetes Networking Model
- Kubernetes Networking CNI - Container Networking Interface
- Kubernetes Service 
  - ClusterIP
  - NodePort
  - LoadBalancer
  - ExternalName
- Kubernetes Ingress
- Kubernetes DNS
- Kubernetes IP Allocation
- Kubernetes Network Policies
- Kubernetes Service Mesh with Istio

--- 

[11. Kubernetes Storage]()

> In this module,

`Module Contents:`

- Kubernetes Storage Concept
- Kubernetes Volumes
  - Persistent Volumes
  - Projected Volumes
  - Ephemeral Volumes
- Kubernetes Persistent Volume Claims
- Kubernetes Storage Classes
- Kubernetes Storage CSI - Container Storage Interface 

---

[12. Kubernetes Security & Policies]()

> In this module, 

`Module Contents:`

---

[13. Kubernetes Troubleshooting]()

> In this module, 

`Module Contents:`

---

[Bonus Section]()

> This section is

---

