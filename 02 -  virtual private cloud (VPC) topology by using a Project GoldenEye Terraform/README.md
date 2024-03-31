# VPC basic example

This example uses the IBM Cloud Terraform provider to create the following infrastructure:

- Provision a VPC that uses the output from the `acl-profile` module as the value for the `var.acl_rules_map` variable.
- Add the `ibm-ntp-server` virtual private endpoint (VPE) for the transit zone
