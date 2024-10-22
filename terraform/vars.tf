variable "AWS_REGION" {
  default = "us-west-1"
}

variable "AMI" {
  type = map(string)

  default = {
    us-west-1 = "ami-0cf4e1fcfd8494d5b"
  }
}