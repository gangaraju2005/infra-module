resource "aws_instance" "jin" {
    ami           = var.ami
    instance_type = var.instance_type
    subnet_id     = aws_subnet.na[0].id
    vpc_security_group_ids = [aws_security_group.sg.id]
  
}
