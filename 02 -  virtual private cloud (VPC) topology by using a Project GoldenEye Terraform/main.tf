##############################################################################
# Resource Group
##############################################################################

module "resource_group" {
  source = "git::https://github.com/terraform-ibm-modules/terraform-ibm-resource-group.git?ref=v1.1.4"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

# ACL profile
module "profile" {
  source = "git::https://github.ibm.com/GoldenEye/acl-profile-ocp.git?ref=1.3.1"
}

# VPC
module "vpc" {
  source            = "../.."
  unique_name       = var.prefix
  ibm_region        = var.region
  resource_group_id = module.resource_group.resource_group_id
  acl_rules_map = {
    private = concat(module.profile.base_acl, module.profile.https_acl, module.profile.deny_all_acl)
  }
  virtual_private_endpoints = {
    ntp : "ibm-ntp-server"
  }
  vpc_tags = var.resource_tags
}

resource "ibm_is_security_group" "example" {
  name = "example-security-group"
  vpc  = module.vpc.vpc_id
}
