terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "5.95.0"
        }
    }

    cloud { 
        organization = "Cloud-Queror" 
        workspaces { 
            name = "AWS_Terraform_Deployment" 
        } 
    } 
}