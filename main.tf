provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  count         = 1
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 em us-east-1
  instance_type = "t2.micro"
  key_name      = "my-key-ssh" # nome da chave criada no console AWS

  tags = {
    Name = "WebServer-${count.index}"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ../ansible/inventory.ini"
  }
}
