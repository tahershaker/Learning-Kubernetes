# Building A Kubernetes Cluster with kubeadm

This section will cover building, installing, and bootstrapping a kubernetes cluster using kubeadm. This section will provide a step-by-step guide for building a kubernetes cluster with no high-availability. As explained in a previous section, this is one of the topologies available for a kubernetes cluster architecture. Only 1 Master node hosting the control plan components and 2 Worker Nodes to host the containerized workload applications. 

As explained, kubeadm do not provision the underlying infrastructure (physical server, virtual machine, networking, etc...), it will only automate and help bootstrapping and installing kubernetes components on the master node and join worker nodes to the cluster.

The underlying infrastructure is pre-built on AWS, below diagram explains the architecture.

---

<p align="center">
    <img src="images/AwsArch.png">
</p>

---

__Infrastructure Info:__

- 1 VPC                 - Name: kube-vpc01  - Network CIDR: 10.10.0.0/16
- 1 Public Subnet       - Name: kube-sub01  - Network CIDR: 10.10.10.0/24   -   Public IP Allowed
- 1 Internet Gateway    - Name: kube-igw01  - Attached to kube-vpc01
- 1 Routing Table       - Name: kube-rt01   - Attached to kube-vpc01 and associated to kube-sub01
- 1 Security Group      - Name: kube-sg01   - Attached to kube-vpc01 and associated to kube-sub01
- 3 EC2 Instances:      - Info in below table & all created in kube-sub01

| Name      | OS           | Private IP      | Public IP   |
|-----------|--------------|-----------------|-------------|
| kube-mn01 | Ubuntu 20.04 | 10.10.10.11/24  | 3.10.152.31 |
| kube-wn01 | Ubuntu 20.04 | 10.10.10.101/24 | 13.40.7.253 |
| kube-wn02 | Ubuntu 20.04 | 10.10.10.102/24 | 3.8.215.234 |


> Step-By-Step Guide




---

#### References


---

> Next Step:

[Interacting with Kubernetes using kubectl](https://github.com/tahershaker/Learning-Kubernetes/tree/main/4.%20Interacting%20with%20Kubernetes%20using%20Kubectl)