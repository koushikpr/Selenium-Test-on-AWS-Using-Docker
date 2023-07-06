resource "aws_instance" "web" {
    ami = var.myimageid
    instance_type = "t2.micro"
    count = "1"
    tags = "workernodes"
    user_data = file("${path.module}/startup.sh")

  
}