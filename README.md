# Kubernetes Monitoring with Prometheus & Grafana using Terraform

## Project Overview

This project demonstrates how to deploy a **Kubernetes monitoring stack** using **Terraform and Helm**. The monitoring stack includes **Prometheus** for metrics collection and **Grafana** for visualization dashboards.

The infrastructure is deployed on an **AWS EC2 instance** running a **Minikube Kubernetes cluster**, and the monitoring tools are installed using **Helm charts managed by Terraform**.

This project showcases **Infrastructure as Code (IaC)** practices and DevOps monitoring concepts.

---

# Architecture

![Architecture Diagram](/img/Architecture-Diagram.png)

Workflow:
---
Terraform → Kubernetes Cluster → Helm → Prometheus → Grafana → Monitoring Dashboard

---

# Technologies Used

* Terraform
* Kubernetes (Minikube)
* Helm
* Prometheus
* Grafana
* AWS EC2
* kubectl
* Git

---

# Project Structure

```
terraform-kubernetes-prometheus-grafana-monitoring
│
├── provider.tf
├── namespace.tf
├── prometheus.tf
├── grafana.tf
├── variables.tf
├── outputs.tf
├── images
│   └── architecture.png
└── README.md
```

---

# Terraform Resources Created

Terraform provisions the following resources:

| Resource                        | Description                      |
| ------------------------------- | -------------------------------- |
| kubernetes_namespace.monitoring | Creates the monitoring namespace |
| helm_release.prometheus         | Deploys Prometheus Helm chart    |
| helm_release.grafana            | Deploys Grafana Helm chart       |

---

# Infrastructure Setup

The infrastructure used in this project:

* AWS EC2 instance
* Docker installed
* Minikube Kubernetes cluster
* Helm package manager
* Terraform for automation

---

# Deployment Steps

## 1. Initialize Terraform

```
terraform init
```

This command downloads the required providers for:

* Kubernetes
* Helm

---

## 2. Check Terraform Plan

```
terraform plan
```

Terraform shows the resources it will create:

```
kubernetes_namespace.monitoring
helm_release.prometheus
helm_release.grafana
```

---

## 3. Apply Infrastructure

```
terraform apply --auto-approve
```

Terraform will deploy:

* Monitoring namespace
* Prometheus
* Grafana

---

# Verify Deployment

Check running pods:

```
kubectl get pods -n monitoring
```

Example output:

```
grafana-xxxxx
prometheus-server-xxxxx
alertmanager-xxxxx
prometheus-node-exporter
```

---

# Access Prometheus

Start port forwarding:

```
kubectl port-forward svc/prometheus-server 9090:80 -n monitoring --address 0.0.0.0
```

Open in browser:

```
http://EC2-IP:9090
```

Prometheus collects Kubernetes metrics.

---

# Access Grafana

Start port forwarding:

```
kubectl port-forward svc/grafana 3000:80 -n monitoring --address 0.0.0.0
```

Open in browser:

```
http://EC2-IP:3000
```

Login credentials:

```
Username: admin
Password: retrieved from Kubernetes secret
```

---

# Monitoring Dashboard

Grafana connects to Prometheus as a data source and visualizes metrics such as:

* CPU usage
* Memory usage
* Pod health
* Cluster performance

---

# Screenshots

## Terraform Init

![Terraform-Init](/img/terraform-init.png)

## Terraform Apply

![](/img/apply-1.png)
![](/img/apply-2.png)


## Running Pods

![K8s-Running-Pods](/img/pods-running.png)


## Prometheus Dashboard

![](/img/Prometheus.png)


## Grafana Dashboard

![](/img/graphana-1.png)
![](/img/graphana-2.png)
![](/img/graphana-3.png)
![](/img/graphana-4.png)

---

# Benefits of Terraform + Helm

Using Terraform with Helm provides several advantages:

* Infrastructure as Code
* Automated deployments
* Reproducible environments
* Version-controlled infrastructure
* Easy scaling and updates

---

# Conclusion

In this project, Terraform was used to automate the deployment of a Kubernetes monitoring stack using Helm charts. Prometheus collects cluster metrics, while Grafana visualizes them through dashboards. This approach ensures consistent and repeatable infrastructure deployments, aligning with modern DevOps practices.

---

# Author

## Vivek Chopade

- MCA Student   
- AWS & DevOps Learner
