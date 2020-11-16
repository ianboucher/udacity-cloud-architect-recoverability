terraform {
    backend "s3" {
        bucket = "tfstate-udacity-iac"
        key = "project1/terraform.tfstate"
        region = "eu-west-1"
    }
}
