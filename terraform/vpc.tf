data "aws_availability_zones" "available" {}
resource "aws_vpc" "main" {
  cidr_block = "12.0.0.0/16"

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${local.env}-main"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.env}-igw"
  }
}

resource "aws_subnet" "private_zone" {
  count             = length(var.private_subnet)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_subnet, count.index)
  availability_zone = var.zones[count.index]

  tags = {
    "Name"                                                 = "${local.env}-private-${var.zones[count.index]}"
    "kubernetes.io/role/internal-elb"                      = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public_zone" {
  count                   = length(var.public_subnet)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_subnet, count.index)
  availability_zone       = var.zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    "Name"                                                 = "${local.env}-public-${var.zones[count.index]}"
    "kubernetes.io/role/elb"                               = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}