
variable instance_type {}

# AMI configuration
data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-x86_64-gp2"]
  }

  owners = ["amazon"] # amazon
}


# ec2 instance configuration

resource "aws_instance" "myweb-app" {
  ami           = data.aws_ami.latest-amazon-linux-image.id
  instance_type = var.instance_type

  availability_zone = var.avail_zone
  subnet_id = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids = [aws_security_group.myapp-sg.id]

  associate_public_ip_address = true
  key_name = "server-key-pair"

  tags = {
    Name = "${var.env_prefix}-ec2"
  }
}

