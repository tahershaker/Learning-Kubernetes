#!/usr/bin/env bash

#References: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
#References: https://kubernetes.io/docs/setup/production-environment/container-runtimes/#containerd
#References: https://github.com/containerd/containerd/blob/main/docs/getting-started.md

# Add Kubernetes version and the IP CIDR that will be used in variables to be used in the script
KUBEVERSION=1.26.4-00

#------------------------------------------------------------------------------------------------

# 1. Install Container Runtime, Required Packages, and configure pre-requisites on Linux System
#------------------------------------------------------------------------------------------------

# 1a. Disable Sawp
sudo swapoff -a

# 1b. Add Overlay and net filters required in kubernetes config file 
# ----------------Add required modules:
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF
# ----------------Load modules:
sudo modprobe overlay
sudo modprobe br_netfilter

# 1c. Configure IPv4 Forwarding and iptables to see bridged traffic in kubernetes config file
# ----------------Configure sysctl params:
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF
# ----------------Apply sysctl params without reboot:
sudo sysctl --system

# 1d. Install Container Runtime containerd and Docker Engine 
# ----------------Add Docker's official GPG key:
sudo apt-get update && sudo apt-get install -y ca-certificates curl gnupg apt-transport-https ipvsadm ipset watch tcpdump gpg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
# ----------------Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# ----------------Update repository and install containerd:
sudo apt-get update && sudo apt-get install -y containerd.io
# ----------------Create containerd configuration file and comment out 'disabled_plugins' and change SystemCgroup to True
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sudo sed -i 's/disabled_plugins/#disabled_plugins/' /etc/containerd/config.toml
sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml
# ----------------restart and enable containerd service
sudo systemctl restart containerd && sudo systemctl enable containerd

#------------------------------------------------------------------------------------------------

# 2. Install Kubeadm, Kubelet, and Kubectl
#------------------------------------------------------------------------------------------------

# 2a. Get and Add Google Package Repository Key and Add the appropriate Kubernetes apt repository
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

# 2b. Install Kubeadm, Kubelet, and Kubectl 
sudo apt-get update && sudo apt-get install -y kubelet=${KUBEVERSION} kubeadm=${KUBEVERSION} kubectl=${KUBEVERSION}
# ----------------stop automatic update
sudo apt-mark hold kubelet kubeadm kubectl

#------------------------------------------------------------------------------------------------

# 3. Initialize the Kubernetes Cluster and configure Kubectl
#------------------------------------------------------------------------------------------------

# 3a. Initialize Kubeadm with required configuration 
sudo kubeadm init --pod-network-cidr=${PODCIDR}  --service-cidr=${SVCCIDR} --kubernetes-version=${KUBEVERSION}

# 3b. Configure kubectl
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#------------------------------------------------------------------------------------------------

# Enjoy ;)