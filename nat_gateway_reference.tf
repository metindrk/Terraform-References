# allocate elastic ip. this eip will bu used for the nat-gateway in the 
resource "aws_eip" "eip_for_nat_gateway_az1" {
  vpc      = true
  
  tags = {
    Name = ""
  }
}

# allocate elastic ip. this eip will bu used for the nat-gateway az2
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
resource "aws_eip" "eip_for_nat_gateway_az2" {
  vpc      = true

  tags = {
    Name = ""
  }
}

# create nat gateway in public subnet az1   https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway
resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.eip_for_nat_gateway_az1
  subnet_id     = aws_subnet.public_subnet_az1 

  tags = {
    Name = ""
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = ""
}

# create nat gateway in public subnet az2   https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway
resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id = ""
  subnet_id     = ""

  tags = {
    Name = ""
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = "" 
}

# create private root table az1 and add route through nat gateway       https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "private_root_table_az1" {
  vpc_id = ""

  route {
    cidr_block      = ""
    nat_gateway_id  = ""
  }

  tags      = {
    Name    = ""
  }
}

#associate private app subnet az1 with private root table         
resource "aws_route_table_association" "pprivate_app_subnet_az1" {
  subnet_id      = ""
  route_table_id = ""
}

#associate private data subnet az1 with private root table          https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "private_data_subnet_az1" {
  subnet_id      = ""
  route_table_id = ""
}

# create private root table az2 and add route through nat gateway       https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "private_root_table_az2" {
  vpc_id = ""

  route {
    cidr_block      = ""
    nat_gateway_id  = ""
  }

  tags      = {
    Name    = ""
  }
}

#associate private app subnet az2 with private root table         
resource "aws_route_table_association" "private_app_subnet_az2" {
  subnet_id      = ""
  route_table_id = ""
}

#associate private data subnet az2 with private root table          https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "private_data_subnet_az2" {
  subnet_id      ="" 
  route_table_id = ""
}
