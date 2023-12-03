# Kubernetes Cluster Architecture & Components

Kubernetes is a cluster environment consist of several machine (called Nodes). This kubernetes cluster is known as a kubernetes architecture as this cluster have specific components and requirements. Each component is deployed in a specific way and perform a specific task.

---

<p align="center">
    <img src="images/IntroPic.png">
</p>

---

# Kubernetes Architecture high-Level

Kubernetes is a clustered environment combined of one or more physical server or virtual machine called `nodes`. The kubernetes cluster is divided into 2 main parts. 

The `control plan`, is the part that manages and control the kubernetes cluster and all the objects deployed within. The control plan is built up of several components that run on top of one or more node of the kubernetes cluster. The control plane's components make global decisions about the cluster (for example, scheduling), as well as detecting and responding to cluster events. Control plane components can be run on any machine in the cluster (same or different machine). For design best practice, it is recommended to run them on dedicated machine. All nodes that are part of the control plan are called `Master Nodes`. 

On the other part of the kubernetes cluster is the `Worker Nodes`, the worker nodes are the nodes that hosts the containerized applications. So all containers will be running on top of the worker nodes and not the master nodes. 

The architecture of the kubernetes cluster can differ form one cluster to another depending on the usability of this cluster, however, any kubernetes cluster will have the control plan and the worker nodes. If a kubernetes cluster is used for production, it is advised to have at least 3 master nodes in the control plan and one or more worker nodes hosting the containerized application depending on the number of containers required and their resources. In a lab or a testing environment, only one master node is enough for the control plan. Also there is an option called [Minikube](https://minikube.sigs.k8s.io/docs/) which is a form of a kubernetes cluster deployed on top of macOS, Linux, or Windows machines and is by default contain only one node working as a master node and a worker node. This node will host the control plan components as well as the containerized application. The Minikube is only used for personal testing and not for production environment.

In a production environment, all containers run on the worker nodes that are total separated than the control plan components that run on the master nodes. Kubernetes itself provide the capability to run everything on only one node (working as master and worker node) which is not a recommended way of running kubernetes in your environment.

`Please Note: In kubernetes, the container runs inside of a kubernetes object called Pod. so whenever a Pod is referenced, it points to the container running inside of the Pod`

Referring to Kubernetes official documentation [_Referenced Below_], `Kubernetes Components:"`:

- A Kubernetes cluster consists of a set of worker machines, called nodes, that run containerized applications. Every cluster has at least one worker node.

- The worker node(s) host the Pods that are the components of the application workload. The control plane manages the worker nodes and the Pods in the cluster. In production environments, the control plane usually runs across multiple computers and a cluster usually runs multiple nodes, providing fault-tolerance and high availability.

---

## Kubernetes Main Components - (Control Plan & Worker Nodes Components)

Kubernetes is based on several components to provide it's desired outcomes, based on the high-level architecture examined in the previous section, there will be 2 main parts in the kubernetes cluster architected, the `Master Nodes` which will host the `Control Plan` components and `Worker Nodes` which will host another type of components.

### Control Plan Components

The components in the control plan (which will be running on top of the master nodes) are responsible for interacting with the kubernetes cluster and making decisions for the cluster to perform properly. All the components of the control plan will be running inside containers hosted inside a Pod (as explained before, containers in kubernetes will be running inside an kubernetes object called Pod) running on top of the Master Nodes. There are 4 main components in the kubernetes control plan and if the kubernetes cluster deployed on a cloud provider (such as AWS, GCP, Azure or even VMware vSphere), there will be another 5th component that may be deployed to interact with the cloud provider.

Referring to Kubernetes official documentation [_Referenced Below_], `Kubernetes Components:"`:

- The control plane's components make global decisions about the cluster (for example, scheduling), as well as detecting and responding to cluster events (for example, starting up a new pod when a deployment's replicas field is unsatisfied).

- Control plane components can be run on any machine in the cluster. However, for simplicity, set up scripts typically start all control plane components on the same machine, and do not run user containers on this machine. 

> API Server Component

`The API server expose th kubernetes cluster API and serve as the front-end of the kubernetes cluster.`

The API Server is the first main component in the kubernetes control plan. This components is responsible for communication and interacting with the kubernetes cluster. Any request sent to a kubernetes cluster to perform any action will be sent to the API server component. The API Server Instance (by instance, it means, the Pod that will have the container running the API Server Service inside of it) will be deployed and will have a dedicated IP address to be able to send and receive requests to and from the kubernetes cluster. In a highly-available architecture, the API server instance may be replication to have more than one running on more than one node with a load balancer service running to load balancer the requests to and from the API server instances.

Referring to Kubernetes official documentation [_Referenced Below_], `Kubernetes Components:"`:

The API server is a component of the Kubernetes control plane that exposes the Kubernetes API. The API server is the front end for the Kubernetes control plane.

The main implementation of a Kubernetes API server is [kube-apiserver](https://kubernetes.io/docs/reference/generated/kube-apiserver/). kube-apiserver is designed to scale horizontally—that is, it scales by deploying more instances. You can run several instances of kube-apiserver and balance traffic between those instances.


> Controller Manager

`The Controller Manager is responsible for running multiple controllers that maintain the desired state of the cluster.`

The Controller Manager is considered as the control plan of the kubernetes cluster. It includes several controllers running within and each controller have a specific task to perform. The Controller Manager basically is the components that look after the objects within the kubernetes cluster. Each controller in the controller manager runs as an instances (as explained before, by instance, it means, the Pod that will have the container running the API Server Service inside of it). 

Each controller instance is responsible of a specific task, for example, the node controller makes sure that all nodes are healthy and respond to any event that takes place to a node making it unresponsive. 




---

> References:

- [Kubernetes Components](https://kubernetes.io/docs/concepts/overview/components/)
- [Kubernetes Architecture](https://kubernetes.io/docs/concepts/architecture/)
- [Kubernetes Overview - official Document](https://kubernetes.io/docs/concepts/overview/)
- [Communication between Nodes and the Control Plane](https://kubernetes.io/docs/concepts/architecture/control-plane-node-communication/)

---

> Next Step:

[Installing Kubernetes]()