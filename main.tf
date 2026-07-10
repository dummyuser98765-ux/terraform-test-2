resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  tags = {
      app = "frontend"
  }
}

# data "aws_ami" "al2023" {
#     most_recent = true
    
#     owners = ["amazon"]
    
#     filter {
#         name = "name"
#         values = ["al2023-ami-*-x86_64"]
#     }
# }

# locals {
#  instance_type = var.environment == "prd" ? "t3.large" : "t3.micro"
# }
# resource "aws_instance" "shopez_web" {
#  ami = data.aws_ami.al2023.id
# #  ami = "ami-001cdb7a098168a1d"
# #  availability_zone = "ap-southeast-2"
#  instance_type = local.instance_type
#  tags = { Name = "shopez-web-${var.environment}" }
# }

variable "bucket_name" {
  type = string
  default = "anup-test-bucket-local"
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}


data "aws_ami" "ubuntu" {

  most_recent = true
 
  filter {

    name   = "name"

    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]

  }
 
  filter {

    name   = "virtualization-type"

    values = ["hvm"]

  }
 
  owners = ["099720109477"] # Canonical

}
 
resource "aws_instance" "example" {

  ami           = data.aws_ami.ubuntu.id

  instance_type = "t2.small"
 
  tags = {

    Name = "HelloWorld"

  }

}
 
