locals {
  permissions_boundary_type = contains(keys(var.permissions_boundary), "aws_managed_policy") ? "aws_managed_policy" : "customer_managed_policy"
}