 #provider "aws" {
  #access_key = "AKIAJQ7KF6MX5QNGGMSA"
  #secret_key = "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"
  #region     = "us-east-1"
#}

resource "aws_instance" "frontend" {
  ami           = "ami-06b5810be11add0e2"
  instance_type = "t2.micro"
  count = 2
  user_data =  <<-EOF
              #!/bin/bash
              apt-get install nginx -y
		EOF
}
