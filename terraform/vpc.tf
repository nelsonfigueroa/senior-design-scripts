# create a VPC
resource "aws_vpc" "databae-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "databae_vpc"
  }
}

# create public subnet

resource "aws_subnet" "databae-public-subnet" {
  cidr_block        = "10.0.0.0/24"
  vpc_id            = "${aws_vpc.databae-vpc.id}"
  availability_zone = "us-west-1a"

  tags = {
    Name = "databae_subnet_public"
  }
}

# create private subnet
resource "aws_subnet" "databae-private-subnet" {
  cidr_block        = "10.0.1.0/24"
  vpc_id            = "${aws_vpc.databae-vpc.id}"
  availability_zone = "us-west-1c"

  tags = {
    Name = "databae_subnet_private"
  }
}

# provision internet gateway and attach to VPC
resource "aws_internet_gateway" "databae-gateway" {
  vpc_id = "${aws_vpc.databae-vpc.id}"

  tags = {
    Name = "databae_gateway"
  }
}

# change route table associated with public subnet (1 route table created by default with VPC i think)
#...or create one
resource "aws_route_table" "databae-public-route-table" {
  vpc_id = "${aws_vpc.databae-vpc.id}"

  # Note that the default route, mapping the VPC's CIDR block to "local", is created implicitly and cannot be specified.
  # cidr_block = "10.0.0.0/16" is implied

  route {
    # destination
    cidr_block = "0.0.0.0/0"

    # target
    gateway_id = "${aws_internet_gateway.databae-gateway.id}"
  }
  tags = {
    Name = "databae_public_route_table"
  }
}

# associate a subnet with the route table (public subnet in this case)
resource "aws_route_table_association" "route-table-association-public" {
  subnet_id      = "${aws_subnet.databae-public-subnet.id}"
  route_table_id = "${aws_route_table.databae-public-route-table.id}"
}

# set the main route table for VPC
resource "aws_main_route_table_association" "a" {
  vpc_id         = "${aws_vpc.databae-vpc.id}"
  route_table_id = "${aws_route_table.databae-public-route-table.id}"
}

# create security group for public EC2 Instances (App, Database, Mail)
resource "aws_security_group" "public-security-group" {
  name        = "public_group"              # 'group name' column
  description = "Publicly available ports"
  vpc_id      = "${aws_vpc.databae-vpc.id}"

  ### Inbound ###

  # ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTPS 
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # MySQL/Aurora
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.31.11.238/32"] # only from app server?
  }
  # POP3
  ingress {
    from_port   = 110
    to_port     = 110
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # POP3S
  ingress {
    from_port   = 995
    to_port     = 995
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # IMAP
  ingress {
    from_port   = 143
    to_port     = 143
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # IMAPS
  ingress {
    from_port   = 993
    to_port     = 993
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # SMPT
  ingress {
    from_port   = 25
    to_port     = 25
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # SMPTS
  ingress {
    from_port   = 465
    to_port     = 465
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # OpsView
  ingress {
    from_port   = 5666
    to_port     = 5666
    protocol    = "tcp"
    cidr_blocks = ["130.166.42.43/32"]
  }
  # OpsView again
  ingress {
    from_port   = 5666
    to_port     = 5666
    protocol    = "tcp"
    cidr_blocks = ["130.166.42.45/32"]
  }
  # idk
  ingress {
    from_port   = 587
    to_port     = 587
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # idk again
  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ### Outbound ALLOW ALL ###

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "public_security_group" # 'security group name' column
  }
}

# create security group for private EC2 Instance (Cache server)
resource "aws_security_group" "private-security-group" {
  name        = "private_group"             # 'group name' column
  description = "Private ports"
  vpc_id      = "${aws_vpc.databae-vpc.id}"

  ### Inbound ###

  # ssh
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    # cidr_blocks = ["0.0.0.0/0"] # no CIDR block, specify subnet instead
    # Allow incoming connections only from public subnet
    security_groups = ["${aws_security_group.public-security-group.id}"]
  }
  # App server to cache server
  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["52.8.214.179/32"]
  }
  # OpsView
  ingress {
    from_port   = 5666
    to_port     = 5666
    protocol    = "tcp"
    cidr_blocks = ["130.166.42.43/32"]
  }
  # OpsView again
  ingress {
    from_port   = 5666
    to_port     = 5666
    protocol    = "tcp"
    cidr_blocks = ["130.166.42.45/32"]
  }

  ### Outbound ALLOW ALL ###

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "private_security_group" # 'security group name' column
  }
}

# provision NAT ec2 instance (or gateway)

# First, get an elastic IP to associate with gateway
resource "aws_eip" "gateway-elastic-ip" {
  vpc = true
}

# provision NAT gateway
resource "aws_nat_gateway" "nat-gateway" {
  subnet_id     = "${aws_subnet.databae-public-subnet.id}" # subnet should be public subnet
  allocation_id = "${aws_eip.gateway-elastic-ip.id}"       # must have an elastic IP associated

  tags = {
    Name = "NAT Gateway"
  }
}

# create another route table associated with private subnet this time
resource "aws_route_table" "databae-private-route-table" {
  vpc_id = "${aws_vpc.databae-vpc.id}"

  # Note that the default route, mapping the VPC's CIDR block to "local", is created implicitly and cannot be specified.
  # cidr_block = "10.0.0.0/16" is implied

  route {
    # destination
    cidr_block = "0.0.0.0/0"

    # target will be NAT gateway instead of internet gateway
    gateway_id = "${aws_nat_gateway.nat-gateway.id}"
  }
  tags = {
    Name = "databae_private_route_table"
  }
}

# associate new route table with private subnet
resource "aws_route_table_association" "route-table-association-private" {
  subnet_id      = "${aws_subnet.databae-private-subnet.id}"
  route_table_id = "${aws_route_table.databae-private-route-table.id}"
}
