# Credentials
provider "aws" {
	access_key = "${var.access_key}"
	secret_key = "${var.secret_key}"
	region     = "${var.region}"
}
# Key
resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

# Lab Instance
resource "aws_instance" "lab-instance" {
  ami                         = "ami-c8580bdf"
  instance_type               = "t2.small"
  key_name                    = "${aws_key_pair.auth.id}"
  subnet_id                   = "subnet-ad2deb91"

  tags {
    Name = "Lab instance"
  }
}
# Elastic IP
resource "aws_eip" "lab-ip" {
   instance   = "${aws_instance.lab-instance.id}"
   vpc        = true
   depends_on = ["aws_instance.lab-instance"]
}

output "Lab-Instance-IP" {
    value = "${aws_eip.lab-ip.public_ip}"
}