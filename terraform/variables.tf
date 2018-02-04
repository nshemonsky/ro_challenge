variable "access_key" {
  description = "AWS Access Key ID"
  default     = ""
}

variable "secret_key" {
  description = "AWS Secret Access Key ID"
  default     = ""
}

variable "region" {
  description = "AWS Region"
  default     = "eu-west-1"
}

variable "ami" {
  default = {
    "eu-west-1" = "ami-d834aba1"
  }
}

variable "key_path" {
  description = "Path to ssh key for access to system"
  default     = ""
}
