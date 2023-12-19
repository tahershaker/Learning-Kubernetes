# Kubernetes Cluster Management - Cluster Management, Administration, & Day 2 Operations


---

<p align="center">
    <img src="images/IntroPic.png">
</p>

---


Draining Nodes

When performing maintainece, you may sometime need to remove a node form the service. You should be able to do so without any interuptions to the workloads running on the node. you should be able to remove the node from the service, apply the maintainence to it and then add it back to the cluster service. to do this, you need to do drain the node. draining the node will force the containers and pods running on this node to move to another node with out interupting the workload application to maintina custmer service and experiecne. once the node is drained you can then perform all activities and then put it back to service.
draining the node will make Containers running on the node will be gracfully terminated and potentially rescheduled on another node

when draining a node, you may need to ignore DeamonSets (Pods that are tied to each node). If you have any deamonsets pods running on the node, you will likely need to use the --ignore-deamonstes flag

kubectl drain <node-name> --ignore-deamonsets

once you perform the maintaince and you want that node to remain part of the cluster and want to allow scheudling pods on that node again, you can use the uncordon command 

kubectl uncordon <node-name>

pS; draining a node will deal with deployment a little bit different from pods
If you have created a single POD that is running on a node that you will be draining, if you drained the node, this Pod will be terminated and this will cause buiness interruption. Thus, if you try to drain a node that have a single Pod running on it, the drain operation will be abort and will not take effect. To force the darin operaition you can use the --force flag. this flag will delete this single Pod from the cluster and will not be deployed anywhere else, so use this flag carefully. In a deployment, you will be having multiple replicaset of the same Pod running on different nodes and with this, the business will not be intrrupted if you drained a node, thus it is possible to drain a node in thie case. When you drain a node, the replica Pod running on this Pod will be terminated but as this Pod is looked after using the ReplicaSet Controller, this Pod will be scheduled on another node.

kubectl get nodes - you will find this node set as schedulingdisable to change it using the uncordon option

---

upgrading a kubernetes cluster with kubeadm

Control Plan Upgrade steps:
- Upgrade Kubeadm on the control plan node
- Drain the Control Plan Node
- Plan the Upgrade (Kubeadm upgrade plan)
- Apply the upgrade (kubeadm upgrade apply)
- Upgrade kubelt and kubectl on the control plan node
- uncordon the control plan node

> ---
Upgrade kubeadm:

[cloud_user@k8s-control]$ sudo apt-get update && \
sudo apt-get install -y --allow-change-held-packages kubeadm=1.27.2-00
Make sure it upgraded correctly:

[cloud_user@k8s-control]$ kubeadm version
Drain the control plane node:

[cloud_user@k8s-control]$ kubectl drain k8s-control --ignore-daemonsets
Plan the upgrade:

[cloud_user@k8s-control]$ sudo kubeadm upgrade plan v1.27.2
Upgrade the control plane components:

[cloud_user@k8s-control]$ sudo kubeadm upgrade apply v1.27.2
Upgrade kubelet and kubectl on the control plane node:

[cloud_user@k8s-control]$ sudo apt-get update && \
sudo apt-get install -y --allow-change-held-packages kubelet=1.27.2-00 kubectl=1.27.2-00
Restart kubelet:

[cloud_user@k8s-control]$ sudo systemctl daemon-reload
[cloud_user@k8s-control]$ sudo systemctl restart kubelet
Uncordon the control plane node:

[cloud_user@k8s-control]$ kubectl uncordon k8s-control
Verify the control plane is working:

[cloud_user@k8s-control]$ kubectl get nodes
If it shows a NotReady status, run the command again after a minute or so. It should become Ready.

> ---


Worker Node Upgrade
- Drain the node
- upgrade kubeadm
- upgrade the kubelt configuration (kubeadm upgrade node)
- Upgrade kubelet and kubectl 
- Uncordon the node

> ---
Run the following on the control plane node to drain worker node 1:

[cloud_user@k8s-control]$ kubectl drain k8s-worker1 --ignore-daemonsets --force
You may get an error message that certain pods couldn't be deleted, which is fine.

In a new terminal window, log in to worker node 1:

ssh cloud_user@<WORKER_1_PUBLIC_IP_ADDRESS>
Upgrade kubeadm on worker node 1:

[cloud_user@k8s-worker1]$ sudo apt-get update && \
sudo apt-get install -y --allow-change-held-packages kubeadm=1.27.2-00
[cloud_user@k8s-worker1]$ kubeadm version
Back on worker node 1, upgrade the kubelet configuration on the worker node:

[cloud_user@k8s-worker1]$ sudo kubeadm upgrade node
Upgrade kubelet and kubectl on worker node 1:

[cloud_user@k8s-worker1]$ sudo apt-get update && \
sudo apt-get install -y --allow-change-held-packages kubelet=1.27.2-00 kubectl=1.27.2-00
Restart kubelet:

[cloud_user@k8s-worker1]$ sudo systemctl daemon-reload
[cloud_user@k8s-worker1]$ sudo systemctl restart kubelet
From the control plane node, uncordon worker node 1:

[cloud_user@k8s-control]$ kubectl uncordon k8s-worker1

> ---


---

Backing up and restoring the etcd

etcd is the backend data storage solution for your kubernetes cluster. as such all your kubernetes objects, application and configuration are stored in etcd. Thearfor you will want to back up the etcd data

You can backup the etcd data using the etcdctl command line tool etcdctl snapshot save command

etcdctl --endpoints <end-point> snapshot save <file-Name>

You can restore the etcd data using the etcdctl command line tool etcdctl snapshot restore


etcdctl --endpoints <end-point> snapshot restore <file-Name>

> ---

Back Up the etcd Data
Look up the value for the key cluster.name in the etcd cluster:

ETCDCTL_API=3 etcdctl get cluster.name \
  --endpoints=https://10.0.1.101:2379 \
  --cacert=/home/cloud_user/etcd-certs/etcd-ca.pem \
  --cert=/home/cloud_user/etcd-certs/etcd-server.crt \
  --key=/home/cloud_user/etcd-certs/etcd-server.key
The returned value should be beebox.

Back up etcd using etcdctl and the provided etcd certificates:

ETCDCTL_API=3 etcdctl snapshot save /home/cloud_user/etcd_backup.db \
  --endpoints=https://10.0.1.101:2379 \
  --cacert=/home/cloud_user/etcd-certs/etcd-ca.pem \
  --cert=/home/cloud_user/etcd-certs/etcd-server.crt \
  --key=/home/cloud_user/etcd-certs/etcd-server.key
Reset etcd by removing all existing etcd data:

sudo systemctl stop etcd
sudo rm -rf /var/lib/etcd
Restore the etcd Data from the Backup
Restore the etcd data from the backup (this command spins up a temporary etcd cluster, saving the data from the backup file to a new data directory in the same location where the previous data directory was):

sudo ETCDCTL_API=3 etcdctl snapshot restore /home/cloud_user/etcd_backup.db \
  --initial-cluster etcd-restore=https://10.0.1.101:2380 \
  --initial-advertise-peer-urls https://10.0.1.101:2380 \
  --name etcd-restore \
  --data-dir /var/lib/etcd
Set ownership on the new data directory:

sudo chown -R etcd:etcd /var/lib/etcd
Start etcd:

sudo systemctl start etcd
Verify the restored data is present by looking up the value for the key cluster.name again:

ETCDCTL_API=3 etcdctl get cluster.name \
  --endpoints=https://10.0.1.101:2379 \
  --cacert=/home/cloud_user/etcd-certs/etcd-ca.pem \
  --cert=/home/cloud_user/etcd-certs/etcd-server.crt \
  --key=/home/cloud_user/etcd-certs/etcd-server.key
The returned value should be beebox.

> ---

---

RBAC Role-Base Access Control 

