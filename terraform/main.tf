provider "aws" {
    region = "us-west-2"

}

terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }

    required_version = "~> 0.13.0"

    backend "s3" {
        bucket = "terraform-backend-bucket-4312412"
        key = "tf.state"
        region = "us-east-1"
        dynamodb_table = "terraform_backend_lock_table"
        encrypt = true
    }


}

module "myapp" {
  source = "./modules"
}