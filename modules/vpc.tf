resource "aws_vpc" "ui" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = var.vpc_name
    }

}
resource "aws_subnet" "na" {
    vpc_id     = aws_vpc.ui.id
    cidr_block = var.subnet_cidr
    availability_zone = var.subnet_az

    tags = {
        Name = "ExamSubnet"
    }
}

resource "aws_subnet" "ux" {
    vpc_id     = aws_vpc.ui.id
    cidr_block = "12.0.2.0/24"
    availability_zone = "us-east-1b"

    tags = {
        Name = "ExamSubnetUX"
    }
}
resource "aws_route" "route" {
    route_table_id         = aws_vpc.ui.main_route_table_id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.ui.id

    tags = {
        Name = "ExamIGW"
    }
  
}
resource "aws_security_group" "sg" {
    name        = "allow_http_inbound_vpc"
    description = "Allow HTTP inbound traffic in VPC"
    vpc_id      = aws_vpc.ui.id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# one way to reference an existing security group
# data "aws_security_group" "one" {
#     filter {
#         name   = "group-id"
#         values = ["sg-0e96719b728a4ea72"]
#     }  
# }

# another way to reference an existing security group
# data "aws_security_group" "none" {
#     id = "sg-0e96719b728a4ea72"
  
# }

#again another way to reference an existing security group
# data "aws_security_group" "two" {
#     id = "sg-0e96719b728a4ea72"
#     vpc_id = aws_vpc.ui.id
# }