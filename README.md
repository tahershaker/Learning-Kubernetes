# Learn Kubernetes From Beginner To Advanced


Kubernetes is a powerful open-source system, initially developed by Google and supported by the Cloud Native Computing Foundation (CNCF), for managing and orchestrating containerized applications in a modern application cloud-native environment. This repo is built to help explaining and teaching kubernetes. 

---

<p align="center">
    <img src="images/IntroPic.png">
</p>

---


## Learning Kubernetes Course Contents

[1. Introduction To Kubernetes]()

> In this module, we will be covering the basic concept of kubernetes as an introduction point to kubernetes.

`Module Contents:`

- Microservices & Containers Quick Recap
- The Need For Kubernetes
- Kubernetes Basic Introduction - [Core Concept]
- Benefits Of Kubernetes
- Kubernetes Is Not An End-To-End Platform - [What Would Kubernetes NOT Provide]
- Kubernetes Behind The Scenes - [How Dose Kubernetes Work]

---

[2. Kubernetes Cluster Architecture]()

> In this module, we will discuss the components building-blocks, and architecture of a kubernetes cluster and the understanding of the kubernetes high-level picture.

`Module Contents:`

- Kubernetes Architecture Introduction - [High Level]
- Kubernetes Objects Introduction [High Level]
  - What is a Kubernetes Object
  - Simple Examples Of Kubernetes basic Objects
    - Kubernetes Node [High Level]
    - Kubernetes Namespace [High Level]
    - Kubernetes Pods [High Level]
    - Kubernetes Deployment [High Level]
    - Kubernetes Services [High Level]
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

---

[3. Kubernetes Cluster High-Availability]()

> In this module, we will be discussing how can we achieve high availability in a kubernetes cluster and what are the type of topologies available for a highly available kubernetes cluster.

`Module Contents:`

- Kubernetes Cluster High Availability Concept
- Kubernetes Cluster High Availability Topologies
  - Stacked etcd Kubernetes Cluster
  - External etcd Kubernetes Cluster
  - Stacked High Availability Control Plan Kubernetes Cluster
  - External High Availability Control Plan Kubernetes Cluster

---

- [4. Kubernetes Management Tools]()
  - This module will cover the different management tools to be used with kubernetes for different tasks, This module will only provide a very high-level introduction to the management tools and will not go into details of the different tools.
  - In this module we will cover the following points:
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

- [4. Building A Kubernetes Cluster]()
  - This module will cover an introduction on how to build a kubernetes cluster and will have a dedicated sub-module providing a step-by-step guide on building a kubernetes cluster and each sub-module will cover a different kubernetes topology that was explained in the previous module
  - In this module we will cover the following points:
    - Tools Available for Building a Kubernetes Cluster
    - What is Kubeadm
    - Building a Kubernetes Cluster Using Kubeadm 
      - [Dedicated Module] - Building A Kubernetes Cluster [Stacked etcd] - Step By Step Guide
      - [Dedicated Module] - Building A Kubernetes Cluster [External etcd] - Step By Step Guide
      - [Dedicated Module] - Building A High Available Control Plan Kubernetes Cluster [Stacked etcd] - Step By Step Guide
      - [Dedicated Module] - Building A High Available Control Plan Kubernetes Cluster [External etcd] - Step By Step Guide

---

- [5. Kubectl and YAML Deep-Dive]()
  - This module will go into deep details covering the YAML files and formate, as well as, the kubectl CLI tool explaining how to install, configure, and use the kubectl tool
  - In this module we will cover the following points:
    - YAML
    - Kubectl
      - What is Kubectl
      - Kubectl Syntax
      - Kubectl Configuration (kubeconfig) File
      - Multiple kubernetes cluster Management with kubectl
        - Using Kubeconfig Context
        - Using KUBECONFIG environment variable
        - Using the --kubeconfig flag command line
      - kubectl imperative vs declarative commands
      - List of main kubectl operation commands

---

- [5. Kubernetes Workloads Objects]()
- [6. Kubernetes Networking]()
- [7. Kubernetes Storage]()
- 