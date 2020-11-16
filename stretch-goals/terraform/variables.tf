variable "aws_region" {
  default = "eu-west-1"
}

variable "vpc_id" {
  default = "vpc-02e472b08ca6703bc"
}

variable "vpc_security_group_ids" {
  default = ["sg-011f3b4672acc8158"]
}

variable "subnet_ids" {
  default = ["subnet-0a1137cac6027fb32", "subnet-00036f7ed43797511"]
}

variable "instance_type" {
  default = "db.t3.micro"
}

variable "port" {
  default = "3306"
}
