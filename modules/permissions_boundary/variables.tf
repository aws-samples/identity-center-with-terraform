variable "instance_arn" {
  type = string
}

variable "permission_set_arn" {
  type = string
}

variable "permissions_boundary" {
  type = map(string)
}

