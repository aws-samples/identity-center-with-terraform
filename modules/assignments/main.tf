// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

data "aws_ssoadmin_permission_set" "this" {
  instance_arn = var.instances_arns
  name         = var.permission_set
}

data "aws_identitystore_group" "this" {
  count             = var.principal_type == "Group" ? 1 : 0
  identity_store_id = var.identity_store_id

  alternate_identifier {
    unique_attribute {
      attribute_path  = "DisplayName"
      attribute_value = var.principal
    }
  }
}

data "aws_identitystore_user" "this" {
  count             = var.principal_type == "User" ? 1 : 0
  identity_store_id = var.identity_store_id

  alternate_identifier {
    unique_attribute {
      attribute_path  = "UserName"
      attribute_value = var.principal
    }
  }
}

resource "aws_ssoadmin_account_assignment" "this" {
  for_each           = toset(var.account_assignment)
  instance_arn       = var.instances_arns
  permission_set_arn = data.aws_ssoadmin_permission_set.this.arn

  principal_id   = local.data_source
  principal_type = local.principal_type_upper

  target_id   = each.value
  target_type = "AWS_ACCOUNT"
}


