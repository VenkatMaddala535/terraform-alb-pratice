resource "aws_security_group" "ALB-SG" {
  name        = "alb-security-group"
  description = "Allow HTTP traffic to ALB"
  vpc_id      = aws_vpc.DDHB-VPC.id

  ingress {
    description = "allows HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "allows all ssh"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ALB-SG"
  }
}

resource "aws_lb" "DDHB-ALB" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ALB-SG.id]
  subnets            = [aws_subnet.DDHB-SUBNET-01.id, aws_subnet.DDHB-SUBNET-02.id]
  tags = {
    Name = "DDHB-ALB"
  }
}

resource "aws_lb_target_group" "DDHB-ALB-TG" {
  name     = "my-ec2-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.DDHB-VPC.id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  tags = {
    Name = "DDHB-ALB-TG"
  }
}

resource "aws_lb_target_group_attachment" "DDHB-ALB-TGA-01" {
  target_group_arn = aws_lb_target_group.DDHB-ALB-TG.arn
  target_id        = aws_instance.ec2-01.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "DDHB-ALB-TGA-02" {
  target_group_arn = aws_lb_target_group.DDHB-ALB-TG.arn
  target_id        = aws_instance.ec2-02.id
  port             = 80
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.DDHB-ALB.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.DDHB-ALB-TG.arn
  }

}