// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

locals {
  permissions_boundary_type = contains(keys(var.permissions_boundary), "aws_managed_policy") ? "aws_managed_policy" : "customer_managed_policy"
}

