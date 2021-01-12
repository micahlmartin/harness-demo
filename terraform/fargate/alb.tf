# Create a basic ALB 
resource "aws_lb" "main" {
  name = var.name
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.http.id]
  subnets = [data.aws_subnet.selected.id]
}

# Create primary target group
resource "aws_alb_target_group" "primary" {
  name = "${var.name}-primary"
  port = 80
  protocol = "HTTP"
}

# Create staging target group
resource "aws_alb_target_group" "stage" {
  name = "${var.name}-primary"
  port = 80
  protocol = "HTTP"
}

# Create the primary Listener 
resource "aws_alb_listener" "primary" {
  
  default_action {
    target_group_arn = aws_alb_target_group.primary.id
    type = "forward"
  }

  load_balancer_arn = aws_alb.main.id
  port = 80 
  protocol = "HTTP"
}


# Create the staging Listener 
resource "aws_alb_listener" "stage" {
  
  default_action {
    target_group_arn = aws_alb_target_group.stage.id
    type = "forward"
  }

  load_balancer_arn = aws_alb.main.id
  
  port = 8080
  
  protocol = "HTTP"
}


