
resource "aws_vpc" "web_vpc" {
  cidr_block           = "192.168.100.0/24"
  enable_dns_hostnames = true

  tags = {
    Name = "Web VPC"
  }
}

resource "aws_subnet" "web_subnet" {
  count             = 2
  vpc_id            = aws_vpc.web_vpc.id
  cidr_block        = cidrsubnet(var.network_cidr, 2, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "Web Subnet ${count.index + 1}"
  }
}

resource "aws_instance" "web" {
  count                  = var.instance_count
  ami                    = lookup(var.ami_ids, "us-west-2")
  key_name               = "aseef"
  instance_type          = "t2.micro"
  subnet_id              = element(aws_subnet.web_subnet.*.id, count.index % length(aws_subnet.web_subnet.*.id))
  
  user_data              = file("./modules/user_data.sh")
  
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = { 
    Name = "Web Server ${count.index + 1}"
  }
}

