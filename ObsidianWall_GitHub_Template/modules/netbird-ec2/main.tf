
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "netbird" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  tags = {
    Name = "NetbirdVPN"
  }

  user_data = <<-EOF
              #!/bin/bash
              curl -fsSL https://pkgs.netbird.io/install.sh | sh
              systemctl enable netbird
              systemctl start netbird
              EOF
}
