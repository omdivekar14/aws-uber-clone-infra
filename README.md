# AWS Infrastructure with Terraform (End-to-End Project)

This project provisions a complete AWS infrastructure using **Terraform**, including:
- VPC, Subnets, and Security Groups
- Application Load Balancer (ALB)
- Auto Scaling EC2 Instances (with Flask app + Nginx)
- RDS MySQL Database


---

## 📂 Project Structure
aws-infra-project/
│── vpc.tf
│── alb.tf
│── ec2.tf
│── rds.tf
│── variables.tf
│── terraform.tfvars
│── outputs.tf
│── user_data.sh.tftpl

---

## 🚀 Steps Implemented

1. Provisioned VPC and Subnets (Public + Private)
2. Created Security Groups for ALB, EC2, and RDS
3. Configured Application Load Balancer
4. Created Launch Template + Auto Scaling Group
5. Provisioned RDS MySQL Database
6. Connected EC2 App → RDS Database
7. Configured Auto Scaling Policies 
---

## 📸 Project Outputs
**Application running via **ALB DNS** (`terraform output alb_dns_name`) 
<img width="1521" height="378" alt="01_alb_app" src="https://github.com/user-attachments/assets/084cd3e7-8e23-4385-8a0e-1e5502c8fe5c" />

**EC2 Auto Scaling Group** instances (tagged `app-server`)
<img width="1564" height="230" alt="02_ec2_asg" src="https://github.com/user-attachments/assets/e67352d0-77ee-4576-88ff-5d4cdbe31a0b" />

**RDS MySQL Database** status = Available, endpoint visible 
<img width="1525" height="255" alt="03_rds" src="https://github.com/user-attachments/assets/ba098fdb-6db4-48b8-9ddc-ead13c7c4739" />

**Terraform Outputs** showing ALB DNS, RDS endpoint, SG, Subnets 
<img width="1231" height="545" alt="04_terraform_outputs" src="https://github.com/user-attachments/assets/5e614191-fe9a-47f4-8764-e97516e504fd" />

**Auto Scaling** 
<img width="1545" height="281" alt="Auto Scaling" src="https://github.com/user-attachments/assets/8a207171-6a14-4cf6-8e9e-586ca5d9a8b6" />

**Registered Targets**
<img width="1540" height="385" alt="Registered Targets" src="https://github.com/user-attachments/assets/f6cf92a6-cf68-40e9-980f-bb62b7404654" />



---

## ⚙️ Tech Stack
- **Terraform v1.13.3**
- **AWS Provider v6.14.1**
- **AWS Services:** VPC, ALB, EC2, Auto Scaling, RDS, CloudWatch
- **Languages/Tools:** Bash, Python Flask, Nginx

---

## 📖 How to Reproduce

1. Clone the repo:
   ```bash
   git clone <your-repo-url>
   cd aws-infra-project
Initialize Terraform:
terraform init

Validate Terraform:
terraform validate

Plan Terraform:
terraform plan

Apply changes:
terraform apply -auto-approve

Get ALB DNS & test app:
terraform output alb_dns_name

📌 Future Improvements
Add CI/CD pipeline (GitHub Actions → Terraform Cloud / AWS CodePipeline)
Use Parameter Store / Secrets Manager for DB credentials
Add monitoring dashboards with CloudWatch or Grafana

👨‍💻 Author
OM DIVEKAR - AWS FRESHER

