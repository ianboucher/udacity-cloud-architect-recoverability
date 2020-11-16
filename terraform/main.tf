provider "aws" {
  shared_credentials_file = "/Users/ianboucher/.aws/credentials"
  profile = "default"
  region = "eu-west-1"
}

resource "aws_db_subnet_group" "default" {
  name       = "primary"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "udarr-tf-1" {
  
  identifier = "udacity-arr-tf"
  engine            = "mysql"
  instance_class    = var.instance_type
  allocated_storage = 20
  storage_encrypted = false

  name     = "udacitytf"
  username = "udarr1_admin"
  password = "***"
  port     = var.port

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name = "primary"
  multi_az = true

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
  backup_retention_period = 0
  enabled_cloudwatch_logs_exports = ["audit", "general"]
  final_snapshot_identifier = "udacity-tf"
  deletion_protection = false

  tags = {
    Owner       = "udarr1_admin"
    Environment = "dev"
  }
}
