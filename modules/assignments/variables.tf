variable "permission_set" {
  type = string
}

variable "principal" {
  type = string
}

variable "principal_type" {
  type = string
}

variable "account_assignment" {
  type = list(string)
}

variable "instances_arns" {
  type = string
}

variable "identity_store_id" {
  type = string
}
