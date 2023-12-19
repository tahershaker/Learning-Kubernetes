# Kubernetes Cheat Sheet and Resources


---

<p align="center">
    <img src="images/IntroPic.png">
</p>

---




---

#### References

- [[1] - Installing Kubernetes Cluster with Deployment Tools](https://kubernetes.io/docs/setup/production-environment/tools/)
- [[2] - Bootstrapping Cluster with Kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/)
- [[3] - Installing Kubernetes with kOps](https://kubernetes.io/docs/setup/production-environment/tools/kops/)
- [[4] - Installing Kubernetes with Kubespray](https://kubernetes.io/docs/setup/production-environment/tools/kubespray/)
- [[5] - Kubeadm](https://kubernetes.io/docs/reference/setup-tools/kubeadm/)


---


https://devops.stackexchange.com/questions/9483/how-can-i-add-an-additional-ip-hostname-to-my-kubernetes-certificate

To do this, you’ll first need your kubeadm configuration file. This creates a file named kubeadm.yaml:

kubectl -n kube-system get configmap kubeadm-config -o jsonpath='{.data.ClusterConfiguration}' > kubeadm.yaml

Now open the file in an editor, and find the certSANs list under the apiServer section. If it does not exist, you’ll need to add it; if so, you’ll just add another entry to that list. Example:

apiServer:
  certSANs:
  - "172.29.50.162"
  - "k8s.domain.com"
  - "other-k8s.domain.net"
  extraArgs:
    authorization-mode: Node,RBAC
  timeoutForControlPlane: 4m0s
Now move the old certificates to another folder, otherwise kubeadm will not recreate new ones:

mv /etc/kubernetes/pki/apiserver.{crt,key} ~

Use kubeadm to generate new apiserver certificates:

kubeadm init phase certs apiserver --config kubeadm.yaml

Now restart your kubeapiserver container:

Run docker ps | grep kube-apiserver | grep -v pause to get the container ID for the container running the Kubernetes API server
Run docker kill <containerID> to kill the container.
The Kubelet will automatically restart the container, which will pick up the new certificate.
If everything is working as expected, don't forget to update the kubeadm ConfigMap stored in the cluster, otherwise, future kubeadm upgrade will be lacking your new config:

If using Kubernetes < v1.15:

kubeadm config upload from-file --config kubeadm.yaml

For Kubernetes version >= v1.15:

kubeadm init phase upload-config kubeadm --config kubeadm.yaml



---

```yaml
apiVersion: v1
kind: pod
metadata:
  name: my-pod
spec:
  containers:
  - name: busybox
    image: radial/busyboxplus:curl
    command: ['sh', '-c', 'while true; do sleep 3600; done']
```

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: beebox-mobile
  labels:
    app: beebox-auth
spec:
  replicas: 3
  selector:
    matchLabels:
      app: beebox-auth
  template:
    metadata:
      labels:
        app: beebox-auth
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```