resource "aws_instance" "pen_pulse" {
  ami           = lookup(var.AMI, var.AWS_REGION)
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.prod-subnet-public.id
  vpc_security_group_ids = [aws_security_group.pen_pulse.id]

  tags = {
    name = "penpulse front end"
  }

  user_data = file("./penpulse.sh")

}