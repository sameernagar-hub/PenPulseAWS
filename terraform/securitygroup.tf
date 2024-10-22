# Security Group
resource "aws_security_group" "pen_pulse" {
  name        = "pen_pulse"
  description = "Allow http ssh in. Allow everthing out"

  vpc_id = aws_vpc.prod-vpc.id
}

resource "aws_security_group_rule" "pen_pulse_http_in" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.pen_pulse.id
}

resource "aws_security_group_rule" "pen_pulse_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.pen_pulse.id
}

resource "aws_security_group_rule" "pen_pulse_everything_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.pen_pulse.id
}