variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "container_image" {
  description = "Docker image to deploy (e.g. yourname/simple-time-service:latest)"
  type        = string
}

