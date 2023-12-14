# Kubernetes Cluster & Object Management with Kubectl & YAML

User Interaction with a Kubernetes cluster to manage a kubernetes cluster or deploy object on the cluster is done through the communication with the [Kube-API-Server](https://github.com/tahershaker/Learning-Kubernetes/tree/main/2.%20Kubernetes%20Cluster%20Architecture%20-%20Components%20%26%20High-level%20Main%20Objects#3a-i-api-server) as explained in a previous section. The communication with the API server can be through a direct REST API call or through the CLI tool called `kubectl`. In most cases kubectl is the tool used to interact with a Kubernetes Cluster. To deploy an object on top of a Kubernetes Cluster, user define the object kind, specs, and desired state of this object in a manifest file in a `YAML` file format. JSON file can also be used but normally YAML files are most commonly used. Thus, managing a kubernetes cluster and objects are based on `kubectl` CLI tool and the `YAML` files.

---

<p align="center">
    <img src="images/IntroPic.png">
</p>

---

## Kubectl CLI Tool

User Interaction with a Kubernetes cluster to manage a kubernetes cluster or deploy object on the cluster is done through the communication with the [Kube-API-Server](https://github.com/tahershaker/Learning-Kubernetes/tree/main/2.%20Kubernetes%20Cluster%20Architecture%20-%20Components%20%26%20High-level%20Main%20Objects#3a-i-api-server) as explained in a previous section. The communication with the API server can be through a direct REST API call or through the CLI tool called `kubectl`. In most cases kubectl is the tool used to interact with a Kubernetes Cluster.

---

### What is Kubectl

Kubectl is a CLI tool for kubernetes used to interact with a kubernetes cluster through `kube-api-server`. Kubectl communicates with the kubernetes API Server and perform the required authentication and then sends API requests to perform the required action. With kubectl, a user can create, update, inspect, delete objects as well as accessing log file and even accessing the shell of the containers running inside the cluster. Kubectl is available to be installed on Linux, Windows, and MacOS. 

When you create a kubernetes cluster, by default, kubectl is also installed with it on the master node along with the required configuration to use kubectl with the cluster. kubectl can also be installed on an external location (ex: local machine) and then used to interact with one or more kubernetes cluster.

You can use kubectl against a kubernetes cluster in 3 different modes:
- __Imperative Commands:__ The user uses kubectl to directly perform an action such as creating a Pod or deleting s Deployment - `kubectl create <object>`
- __Imperative Object Configuration:__ The user uses kubectl along with a manifest file (the `YAML` file) to create or delete an object with the info provided in the YAML file - `kubectl create -f <file-name.yaml>`
- __Declarative Object Configuration:__ The user uses kubectl along with a manifest file (the `YAML` file) to create (if not exists) or update (if exists) an object with the info provided in the YAML file - `kubectl apply -f <file-name.yaml>`

> _Reference_
> _Kubernetes provides a command line tool for communicating with a Kubernetes cluster's control plane, using the Kubernetes API. This tool is named kubectl._<sup>Reference [1](#References)</sup>
> _The Kubernetes command-line tool, kubectl, allows you to run commands against Kubernetes clusters. You can use kubectl to deploy applications, inspect and manage cluster resources, and view logs._<sup>Reference [2](#References)</sup>
> _The kubectl tool supports three kinds of object management:_
>> - _Imperative commands_
>> - _Imperative object configuration_
>> - _Declarative object configuration_<sup>Reference [5](#References)</sup>

---

### Kubectl Configuration File

To access a kubernetes cluster and authenticate with it using kubectl, some information are required such as the IP/FQDN, authentication token and more. By default, kubectl reads all of these info from a file called config, and by default, this file is located at `$HOME/kube/config`. This file get created by default when installing kubernetes using kubeadm as listed in a [previous section](https://github.com/tahershaker/Learning-Kubernetes/tree/main/3.%20Building%20A%20Kubernetes%20Cluster/Building%20A%20Kubernetes%20Cluster%20with%20kubeadm). During the installation process, the below command was executed which created and configured the kubctl config file.

```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

The config file will hold information regarding the following:
- Cluster: The URL for the API of a Kubernetes cluster. This URL identifies the cluster itself.
- User: credentials that identify a user connecting to the Kubernetes cluster.
- Context: puts together a cluster (the API URL) and a user (who is connecting to that cluster).

To use kubectl with anything related to the config file, use `kubectl config <option>`

View the info within the config file:

```bash
kubectl config view
```

---
<p align="center">
    <img src="images/KubeConfigFile.png">
</p>
---

### Using Kubectl with multiple kubernetes cluster

---
<p align="center">
    <img src="images/MultiClusterMgmt.png">
</p>
---

---

### kubectl Contexts




---


#### References

- [[1] - Kubernetes Command Line Tool Kubectl](https://kubernetes.io/docs/reference/kubectl/)
- [[2] - Kubernetes Install Tools](https://kubernetes.io/docs/tasks/tools/)
- [[3] - Install and Set Up kubectl on Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
- [[4] - Manage Kubernetes Objects](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/)
- [[5] - Declarative Management of Kubernetes Objects Using Configuration Files](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/)
- [[6] - Managing Kubernetes Objects Using Imperative Commands](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/imperative-command/)
- [[7] - Imperative Management of Kubernetes Objects Using Configuration Files](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/imperative-config/)
- [[8] - Configure Access to Multiple Clusters](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/)



---

> Next Step:

[Kubernetes Containerized Workloads - Containers, Pods, ReplicaSet, & Deployments](https://github.com/tahershaker/Learning-Kubernetes/tree/main/5.%20Kubernetes%20Containerized%20Workloads%20-%20Pods%20%26%20Deployments)