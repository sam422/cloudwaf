variable "region" {
  type = string
}

variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "workstation_ip" {
  type    = list(string)
  default = ["10.10.10.10/32"]
}

variable "amis" {
  type = map(any)
  default = {
    "us-east-1" : "ami-087c17d1fe0178315"
    "us-east-2" : "ami-00dfe2c7ce89a450b"
  }
}
