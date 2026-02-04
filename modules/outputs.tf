output "vpc_id" {
  value = aws_vpc.ui.id
}

output "instance_id" {
  value = aws_instance.jin.id
}

output "subnet_id" {
  value = aws_subnet.na.id
  
}