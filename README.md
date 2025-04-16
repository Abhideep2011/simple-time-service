
# Simple Time Service

This is a simple microservice built to return the current time and the IP address of the user making the request. It’s a minimal web service created to demonstrate containerization with Docker, deployment with Terraform, and hosting on AWS ECS (or similar cloud services).

## Purpose
This service is intended to showcase your ability to:
- Create a microservice.
- Dockerize the application.
- Set up infrastructure as code using Terraform.
- Deploy the service to AWS.

---

## Prerequisites

To deploy and test this project, you will need the following tools installed:

- **Docker**: For containerizing the application.
  - [Docker installation guide](https://www.docker.com/get-started)
- **Terraform**: To manage cloud infrastructure (AWS in this case).
  - [Terraform installation guide](https://www.terraform.io/downloads.html)
- **AWS CLI**: For AWS credentials management.
  - [AWS CLI installation guide](https://aws.amazon.com/cli/)

---

## Docker Build and Run Steps

1. Clone the repository to your local machine.

   ```bash
   git clone https://github.com/yourusername/simple-time-service.git
   cd simple-time-service
   ```

2. **Build the Docker image**:

   ```bash
   docker build -t simple-time-service .
   ```

3. **Run the Docker container**:

   ```bash
   docker run -p 5000:5000 simple-time-service
   ```

4. The service will be available at `http://localhost:5000`. To test, visit the URL in your browser. You should see a JSON response containing the current timestamp and your IP address.

---

## Setting Up AWS Credentials

Before deploying to AWS, you need to configure your AWS CLI with the appropriate credentials.

1. Run the following command:

   ```bash
   aws configure
   ```

2. Enter your AWS Access Key, Secret Key, region, and output format when prompted. You can find your AWS keys in the AWS Console under **IAM > Users > [Your User] > Security credentials**.

   ```bash
   AWS Access Key ID [None]: YOUR_ACCESS_KEY_ID
   AWS Secret Access Key [None]: YOUR_SECRET_ACCESS_KEY
   Default region name [None]: us-east-1
   Default output format [None]: json
   ```

3. Ensure your user has the necessary permissions for AWS ECS, Lambda, ALB, and other services you will be using.

---

## Running Terraform

1. Ensure you are in the `terraform/` directory, where your `main.tf` is located.

2. Run `terraform init` to initialize Terraform and download necessary provider plugins.

   ```bash
   terraform init
   ```

3. Run `terraform plan` to see the changes Terraform will make to your AWS account.

   ```bash
   terraform plan
   ```

4. Finally, apply the changes:

   ```bash
   terraform apply
   ```

   Confirm with `yes` to proceed.

5. Terraform will deploy the infrastructure and ECS service. Once it’s finished, it will output the **DNS name** of your Application Load Balancer (ALB). This will look something like:

   ```bash
   Outputs:
     alb_dns_name = "simple-time-alb-123456789.us-east-1.elb.amazonaws.com"
   ```

   You can now visit this URL in your browser to test your deployed application.

---

## Testing the Application

After deploying the application with Terraform, navigate to the **DNS URL** of your ALB.

1. Visit the URL (e.g., `http://simple-time-alb-123456789.us-east-1.elb.amazonaws.com`).
2. You should receive a JSON response containing the current time and your IP address:

   ```json
   {
     "timestamp": "2025-04-16T12:34:56",
     "ip": "xx.xx.xx.xx"
   }
   ```

3. If you see this response, your deployment is successful!

---
