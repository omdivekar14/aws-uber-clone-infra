# 🚖 AWS Uber-Clone Infrastructure

## 📘 Project Overview

This repository contains **Terraform code** to deploy a complete AWS infrastructure for an **Uber-like clone application**.
It provisions a secure, scalable, and highly available environment — including **VPC, EC2 (Auto Scaling), ALB, RDS**, and **Security Groups** — to host a Nginx web layer.
---

## 🏗️ Architecture Overview

The infrastructure is designed with a **multi-tier, production-grade layout**:

* **VPC** with segregated public and private subnets across Availability Zones
* **Application Load Balancer (ALB)** in the public subnet to handle HTTP traffic
* **Auto Scaling Group (ASG)** for EC2 instances hosting the app
* **RDS MySQL** instance in a private subnet for secure data storage
* **Security Groups** for controlled inbound/outbound access
* **Terraform Outputs** displaying endpoints like ALB DNS and RDS address

### 📊 Architecture Diagram


![AWS Architecture](https://github.com/user-attachments/assets/9a907319-ef51-43df-8b3c-13952538b72f)

---

## 📂 Project Structure

```
aws-uber-clone-infra/
├── alb.tf                 # Application Load Balancer setup
├── ec2.tf                 # EC2 & Auto Scaling configuration
├── main.tf                # Root Terraform configuration
├── outputs.tf             # Terraform outputs (ALB, RDS endpoints)
├── provider.tf            # AWS provider setup
├── rds.tf                 # RDS MySQL database configuration
├── security-groups.tf     # Security Group definitions
├── terraform.tfvars       # Variable values (region, credentials)
├── user_data.sh.tftpl     # EC2 bootstrap script for app deployment
├── variables.tf           # Input variable definitions
└── README.md              # Documentation
```

---

## 🧰 Tools & Technologies

| Category                   | Tool / Service                          |
| -------------------------- | --------------------------------------- |
| **Infrastructure as Code** | Terraform                               |
| **Cloud Provider**         | AWS                                     |
| **Compute**                | EC2, Auto Scaling Group                 |
| **Networking**             | VPC, Subnets, Security Groups, ALB      |
| **Database**               | RDS (MySQL)                             |
| **Web Server**             | Nginx                                   |
| **Scripting**              | Bash (user data for EC2 initialization) |

---

## 🚀 Deployment Steps

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/omdivekar14/aws-uber-clone-infra.git
cd aws-uber-clone-infra
```

### 2️⃣ Initialize Terraform

```bash
terraform init
```

### 3️⃣ Validate Configuration

```bash
terraform validate
```

### 4️⃣ Preview the Plan

```bash
terraform plan
```

### 5️⃣ Apply Infrastructure

```bash
terraform apply -auto-approve
```

### 6️⃣ Access the Application

Once provisioning completes, view your app:

```bash
terraform output
```

Copy the **ALB DNS name** → paste it into your browser.
✅ You’ll see your **Uber Clone App** running live!

### 7️⃣ Clean Up Resources

```bash
terraform destroy -auto-approve
```

---

## 🖼️ Project Screenshots


| Stage                                     | Screenshot                                                                                                                         |
| ----------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| **Terraform Output – Successful Creation**| ![Terraform Output](https://github.com/user-attachments/assets/4c30e17e-34e3-4331-beab-91b95a611548)                               |
| **EC2 Instances Running**                 | ![EC2 Running](https://github.com/user-attachments/assets/fefcbbcf-e4ab-47bf-ae74-662d2050b87e)                                    |
| **Auto Scaling Group**                    | ![Auto Scaling](https://github.com/user-attachments/assets/e9da70d1-73e7-4c67-a02c-077988a99280)                                   |
| **VPC**                                   | <img width="1920" height="1020" alt="Screenshot 2025-10-28 075217" src="https://github.com/user-attachments/assets/a31292cc-3f62-4687-91c8-c6233c880b1c" /> |
| **Registered Targets**                    |  <img width="1915" height="827" alt="Screenshot 2025-11-06 132800" src="https://github.com/user-attachments/assets/31a6ace5-3adb-4cda-b3f0-b202c86404e5" />
| **Nginx Live via ALB DNS**                | <img width="553" height="211" alt="Screenshot 2025-10-14 194926" src="https://github.com/user-attachments/assets/63c7205b-2bb0-45ee-b393-d9e2340789b3" /> |                 
                                            
---

## 👨‍💻 Author

**Om Divekar**

* 🌐 GitHub: [omdivekar14](https://github.com/omdivekar14)
* 💼 LinkedIn: [Om Divekar](https://www.linkedin.com/in/om-divekar-7b0529362/)

---
