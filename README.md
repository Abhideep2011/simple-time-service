# SimpleTimeService – Particle41 DevOps Challenge

Welcome! This project is a submission for the Particle41 Senior DevOps Challenge. It demonstrates containerized application deployment on AWS ECS using Terraform, along with best practices in documentation, infrastructure-as-code, and cloud-native tools.

---

## 🧩 Project Structure

. ├── app/ # Source code of the microservice │ ├── server.py # Python Flask app │ └── Dockerfile # Dockerfile for containerizing the app └── terraform/ # Terraform configuration to deploy app on AWS ECS ├── main.tf ├── variables.tf ├── terraform.tfvars └── outputs.tf

yaml
Copy
Edit

---

## 🟦 Task 1 – SimpleTimeService Application

### 🔧 About

A tiny web service that returns a JSON with current timestamp and requestor IP when you access the `/` path.

Example response:

```json
{
  "timestamp": "2025-04-15T14:00:00Z",
  "ip": "203.0.113.25"
}
🛠️ Requirements
Docker

Python 3.x

Flask (pip install flask)

▶️ How to Run Locally
bash
Copy
Edit
cd app/
python3 server.py
Visit: http://localhost:8080/

🐳 Build & Run with Docker
Build Docker Image
bash
Copy
Edit
cd app/
docker build -t simple-time-service .
Run Container
bash
Copy
Edit
docker run -p 8080:8080 simple-time-service
Access the service at: http://localhost:8080

🔐 DockerHub Image
The image is published at:

bash
Copy
Edit
docker pull your-dockerhub-username/simple-time-service:latest
Replace your-dockerhub-username with your actual DockerHub repo.

🟨 Task 2 – Terraform Infrastructure on AWS
Deploys:

VPC with 2 public & 2 private subnets

ECS cluster using AWS Fargate

Application Load Balancer

ECS task + service using the Docker container

🌍 Prerequisites
AWS account

IAM user with sufficient permissions

AWS CLI: Install AWS CLI

Terraform 1.3+: Install Terraform

🔐 AWS CLI Setup
bash
Copy
Edit
aws configure
Provide:

AWS Access Key

Secret Key

Region (e.g. us-east-1)

📦 How to Deploy
bash
Copy
Edit
cd terraform/
terraform init
terraform plan
terraform apply
Once applied, Terraform will output the DNS name of the Load Balancer. Access the service via:

bash
Copy
Edit
http://<alb_dns_name>
📤 Cleanup
To avoid unwanted charges, destroy the resources when done:

bash
Copy
Edit
cd terraform/
terraform destroy
✅ Terraform Best Practices Used
Modules (official AWS VPC module)

Proper input variables and defaults

Secure IAM roles for ECS task execution

Load Balancer with health checks

Least privilege security groups

🌟 Extra Credit Ideas (Optional)
CI/CD pipeline with GitHub Actions

S3 + DynamoDB backend for Terraform state

CloudWatch logging for ECS tasks

Use custom domain via Route53

📝 Notes
No secrets are committed. Please use AWS CLI for local auth and avoid exposing credentials publicly.

👤 Author
Particle41 DevOps Challenge Candidate
Created by: Your Name
DockerHub: your-dockerhub
GitHub: github.com/your-username
