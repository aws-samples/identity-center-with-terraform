variable "permission_sets" {
  type = string
}

variable "account_assignments" {
  type = string
}

variable "policies" {
  type    = string
  default = "./policies/"
}
