resource "aws_lightsail_instance" "linux_instance" {
  name              = "controle-produto"
  availability_zone = "us-east-1a"
  blueprint_id      = "ubuntu_24_04_lts"
  bundle_id         = "micro_2_0" 
}