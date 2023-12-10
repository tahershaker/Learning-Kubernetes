# Building A Kubernetes Cluster (Step-By-Step) Using Kubeadm

Building a kubernetes cluster can be complex, fortunately, there are some tools that can help and automate the building and installation process of a kubernetes cluster. Several tools are available where some of them can deploy a kubernetes cluster starting from deploying the machines themselves than install all required resources and kubernetes components on top. One of the most well-known tool is Kubeadm.

---

<p align="center">
    <img src="images/IntroPic.png">
</p>

---

## Tools Available for Building a Kubernetes Cluster

There are several tools that can help in building, deploying, installing and bootstrapping a kubernetes cluster with the different topologies available discusses in the last section. Some of these tool can only bootstrap the installation of a kubernetes cluster, meaning it will only deploy and install kubernetes components and configure them based on the required topology on an existing physical servers or virtual machines - it will not automate the deployment of the machines. Some provide the ability to even deploy the machine on a specific cloud provider.

The available tools listed on the official documentation of kubernetes are `kubeadm`, `kOps`, and `kubespray`.<sup>Reference [1](#References)</sup>

---

## Kubeadm 

Kubeadm is a bootstrapping tool used to help automating building a kubernetes cluster. Kubeadm is a bootstrapping tool which means it only bootstrap existing physical servers or virtual machines to automate the installation of the kubernetes components and build a kubernetes cluster. kubeadm will not help automating the provisioning of physical servers or virtual machines. Kubeadm performs the actions necessary to get a minimum viable cluster up and running quickly. 

kubeadm provides CLI tool to be used to perform tasks related to building a kubernetes cluster such as initializing a kubernetes cluster using `kubeadm init` or joining nodes to the cluster using `kubeadm join`.

> _Reference_
> _Kubeadm is a tool built to provide kubeadm init and kubeadm join as best-practice "fast paths" for creating Kubernetes clusters._<sup>Reference [5](#References)</sup>
> _kubeadm performs the actions necessary to get a minimum viable cluster up and running. By design, it cares only about bootstrapping, not about provisioning machines. Likewise, installing various nice-to-have addons, like the Kubernetes Dashboard, monitoring solutions, and cloud-specific addons, is not in scope._<sup>Reference [5](#References)</sup>
> _Instead, we expect higher-level and more tailored tooling to be built on top of kubeadm, and ideally, using kubeadm as the basis of all deployments will make it easier to create conformant clusters._<sup>Reference [5](#References)</sup>

---

## Building a kubernetes cluster using kubeadm - Different Topologies

As explained in the previous section, there are different kubernetes cluster architecture topology such as: 
- Stacked etcd kubernetes cluster Topology (etcd deployed locally and only one Master Node in the control plan)
- External etcd kubernetes cluster Topology (etcd deployed externally and only one Master Node in the control plan)
- Stacked etcd HA kubernetes cluster Topology (etcd deployed locally and a minimum of 3 Master Node in the control plan)
- External etcd HA kubernetes cluster Topology (etcd deployed externally and a minimum of 3 Master Node in the control plan)

Kubeadm can help building kubernetes cluster with the above mentioned topology, however, maybe some limitation may exists, thus it is advisable to check the [kubernetes official documentation](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/)

In this section, different sub-section is available to provide a step-by-step guide in building a kubernetes cluster based on the above mentioned topologies.

Sub-Sections are:
- [Building A Kubernetes Cluster with kubeadm (step-by-step)]()
- [Building A Kubernetes Cluster with kubeadm  with external etcd (step-by-step)]()
- [Building A High Available Kubernetes Cluster with kubeadm (step-by-step)]()
- [Building A High Available Kubernetes Cluster with kubeadm with external etcd (step-by-step)]()

Also there are another sub-section - [Bash Scripts for Automating Kubeadm]() - as a bonus section holding bash scripts to automate the above tasks

---

#### References

- [[1] - Installing Kubernetes Cluster with Deployment Tools](https://kubernetes.io/docs/setup/production-environment/tools/)
- [[2] - Bootstrapping Cluster with Kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/)
- [[3] - Installing Kubernetes with kOps](https://kubernetes.io/docs/setup/production-environment/tools/kops/)
- [[4] - Installing Kubernetes with Kubespray](https://kubernetes.io/docs/setup/production-environment/tools/kubespray/)
- [[5] - Kubeadm](https://kubernetes.io/docs/reference/setup-tools/kubeadm/)



---

> Next Step:

[Building A Kubernetes Cluster]()