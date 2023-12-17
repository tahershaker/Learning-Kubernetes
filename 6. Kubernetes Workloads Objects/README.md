# Kubernetes Workloads Objects - Containers, Pods, ReplicaSet, Deployment & Supporting Objects


---

<p align="center">
    <img src="images/IntroPic.png">
</p>

---



Namespaces

Namespaces are virtual clusters backed by the same physical cluster. kubernetes objects, such as pods and containers, live in namespace. Namespace are a way to separate and organize objects in your cluster

kubectl get namespaces

all cluster have a default namespace and this namespace is the one used when there are no other namespace specified in the kubectl command.

kubeadm creates another namespace called kubesystem to deploy in all system components and control plan componenst 

--namespace flag (this is equivalent to using the flag -n)
--all-namespaces flag (this is equivalent to using the flag -A)

kubectl create namespace my-namespace


---

Pods and Containers





---

#### References

- [[1] - Installing Kubernetes Cluster with Deployment Tools](https://kubernetes.io/docs/setup/production-environment/tools/)
- [[2] - Bootstrapping Cluster with Kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/)
- [[3] - Installing Kubernetes with kOps](https://kubernetes.io/docs/setup/production-environment/tools/kops/)
- [[4] - Installing Kubernetes with Kubespray](https://kubernetes.io/docs/setup/production-environment/tools/kubespray/)
- [[5] - Kubeadm](https://kubernetes.io/docs/reference/setup-tools/kubeadm/)



---

> Next Step:

[Kubernetes Networking]()