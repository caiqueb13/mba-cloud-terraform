output "vpc_id" {
  value = aws_vpc.vpc_projeto.id
}

output "vpc-arn" {
  value = aws_vpc.vpc_projeto.id
}

output "subnet-name1" {
  value = aws_subnet.projeto-sub1.id
}

output "subnet-name2" {
  value = aws_subnet.projeto-sub2.tags_all
}

output "avai-zone1" {
  value = aws_subnet.projeto-sub1.availability_zone
}

output "vai-zone2" {
  value = aws_subnet.projeto-sub2.availability_zone
}

output "sub1_range" {
  value = aws_subnet.projeto-sub1.cidr_block
}

output "sub2_range" {
  value = aws_subnet.projeto-sub2.cidr_block
}