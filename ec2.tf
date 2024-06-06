resource "aws_instance" "ubuntudataproj" {
    ami = "ami-04b70fa74e45c3917"
    instance_type = "t2.micro"
    count = 1
    subnet_id = aws_subnet.subnet_vpc_dataproj.id
    key_name = "KeyWebServer"
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.sg_dataproj.id ]

    tags = {
      Name = "ubuntudataproj"
    }
}
resource "aws_eip" "eip_dataproj" {
    
    instance = aws_instance.ubuntudataproj[0].id
    }
