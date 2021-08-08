variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-2"
}

variable "ami_image" {
  description = "ubuntu 20.04"
  type        = string
  default     = "ami-0f49ee52a88cc2435"
}

variable "instance_type" {
  description = "EC2 instanace type"
  type        = string
  default     = "t3.micro"
}

variable "wp_port" {
  description = "Wordpress Port"
  type        = number
  default     = 8080
}
