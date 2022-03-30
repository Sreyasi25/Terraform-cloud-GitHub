terraform {
    required_version = "~> 1.1.7" // added latest version
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.7.0"
     }
    }
   }

provider "aws" {
        region = "us-east-1" 
        #profile = "default"
	}

resource "aws_instance" "sreinfra" {
	ami = "ami-0c02fb55956c7d316" 
	instance_type = "t2.micro"
	 count = 3
  tags = {
	       Name = "git-tera-server-${count.index}"
	}

}
