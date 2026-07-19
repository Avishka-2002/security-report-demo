# Sample Terraform Configuration for tfsec scanning demo
# Note: tfsec will scan this Infrastructure-as-Code for security best practices!

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "security-report-demo-bucket"
}

# Example: Server-side encryption configuration (Good practice)
resource "aws_s3_bucket_server_side_encryption_configuration" "demo_encryption" {
  bucket = aws_s3_bucket.demo_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Example security group to scan
resource "aws_security_group" "web_sg" {
  name        = "web_server_sg"
  description = "Security group for web server"

  ingress {
    description = "HTTPS ingress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
