# Terraform variables 
variable "region" {
  default = "us-east-1"
}
variable "access_key" {
  default = ""
}
variable "secret_key" {
  default = ""
}
variable "key_name" {
  default = "lab-key"
}
variable "public_key_path" {
  default = "keys/lab.pub"
}
