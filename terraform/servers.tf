# get AMI for App Server
data "aws_ami" "ami-app-server" {
  most_recent = true # if multiple results come back from AMI search, use most recent

  # search filters for image
  filter {
    name   = "name"         # name filter
    values = ["app-server"]
  }

  filter {
    name   = "virtualization-type" # virtualization type filter
    values = ["hvm"]
  }

  # owner of the image is current account
  owners = ["self"]
}

# get AMI for Database Server
data "aws_ami" "ami-database-server" {
  most_recent = true # if multiple results come back from AMI search, use most recent

  # search filters for image
  filter {
    name   = "name"              # name filter
    values = ["database-server"]
  }

  filter {
    name   = "virtualization-type" # virtualization type filter
    values = ["hvm"]
  }

  # owner of the image is current account
  owners = ["self"]
}

# get AMI for Mail Server
data "aws_ami" "ami-mail-server" {
  most_recent = true # if multiple results come back from AMI search, use most recent

  # search filters for image
  filter {
    name   = "name"          # name filter
    values = ["mail-server"]
  }

  filter {
    name   = "virtualization-type" # virtualization type filter
    values = ["hvm"]
  }

  # owner of the image is current account
  owners = ["self"]
}

# get AMI for Cache Server
data "aws_ami" "ami-cache-server" {
  most_recent = true # if multiple results come back from AMI search, use most recent

  # search filters for image
  filter {
    name   = "name"           # name filter
    values = ["cache-server"]
  }

  filter {
    name   = "virtualization-type" # virtualization type filter
    values = ["hvm"]
  }

  # owner of the image is current account
  owners = ["self"]
}

# Set up App Server EC2 in public subnet
resource "aws_instance" "databae-app-server" {
  # take result from 'data' block above and assign to ami property of instance
  ami           = "${data.aws_ami.ami-app-server.id}"
  instance_type = "t2.micro"

  tags {
    Name = "databae_app_server"
  }

  # assign this instance to public subnet created in resources.tf file
  subnet_id = "${aws_subnet.databae-public-subnet.id}"

  # assign public IP automatically
  associate_public_ip_address = true

  # associate elastic IP (optional)
  # specify private key (assuming key was previously created)
  key_name = "test-app-server"

  # associate previously made security group with instance
  vpc_security_group_ids = ["${aws_security_group.public-security-group.id}"]
}

# Set up Database Server in public subnet
resource "aws_instance" "databae-database-server" {
  # take result from 'data' block above and assign to ami property of instance
  ami           = "${data.aws_ami.ami-database-server.id}"
  instance_type = "t2.micro"

  tags {
    Name = "databae_database_server"
  }

  # assign this instance to public subnet created in resources.tf file
  subnet_id = "${aws_subnet.databae-public-subnet.id}"

  # assign public IP automatically
  associate_public_ip_address = true

  # associate elastic IP (optional)
  # specify private key (assuming key was previously created)
  key_name = "test-app-server"

  # associate previously made security group with instance
  vpc_security_group_ids = ["${aws_security_group.public-security-group.id}"]
}

# Set up Mail Server in public subnet
resource "aws_instance" "databae-mail-server" {
  # take result from 'data' block above and assign to ami property of instance
  ami           = "${data.aws_ami.ami-mail-server.id}"
  instance_type = "t2.micro"

  tags {
    Name = "databae_mail_server"
  }

  # assign this instance to public subnet created in resources.tf file
  subnet_id = "${aws_subnet.databae-public-subnet.id}"

  # assign public IP automatically
  associate_public_ip_address = true

  # associate elastic IP (optional)
  # specify private key (assuming key was previously created)
  key_name = "test-app-server"

  # associate previously made security group with instance
  vpc_security_group_ids = ["${aws_security_group.public-security-group.id}"]
}

# Set up Cache Server EC2 in private subnet
resource "aws_instance" "databae-cache-server" {
  # take result from 'data' block above and assign to ami property of instance
  ami           = "${data.aws_ami.ami-cache-server.id}"
  instance_type = "t2.micro"

  tags {
    Name = "databae_cache_server"
  }

  # assign this instance to private subnet created in resources.tf file
  subnet_id = "${aws_subnet.databae-private-subnet.id}"

  # no public IP for this instance
  # specify private key (assuming key was previously created)
  key_name = "test-app-server"

  # associate previously made security group with instance
  vpc_security_group_ids = ["${aws_security_group.private-security-group.id}"]
}
