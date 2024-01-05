# Terraform Backend
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "myjudibucket"                      # Nom du bucket utilisé sur notre compte AWS
    key    = "tfstate/terraformdetoto.tfstate"
    region = "eu-west-3"
  }
}

# Interconnection avec AWS avec les clés d'accès
provider "aws" {
    region = "eu-west-3"
    access_key = var.aws_access_key # Clé d'accès AWS 
    secret_key = var.aws_secret_key # Clé secrète AWS 
}