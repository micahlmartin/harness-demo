# Create a basic ALB 
resource "aws_alb" "main" {
  name = var.name
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
resource "aws_alb_listener" "staging" {
  
  default_action {
    target_group_arn = aws_alb_target_group.staging.id
    type = "forward"
  }

  load_balancer_arn = aws_alb.main.id
  
  port = 8080
  
  protocol = "HTTP"
}


