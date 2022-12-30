provider "aws" {

  region = "ap-northeast-2"
}

data "aws_vpc" "default" {

  default = true
}

data "aws_subnets" "default" {

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_subnet" "default" {

  for_each = toset(data.aws_subnets.default.ids)
  id    = each.value

}


output "vpc-id" {

  value = data.aws_vpc.default.id
}

output "subnet-cidr_blocks" {

  value = [for s in data.aws_subnet.default : s.cidr_block]
}
