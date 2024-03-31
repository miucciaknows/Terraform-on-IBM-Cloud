# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable descriptions.
# ---------------------------------------------------------------------------------------------------------------------

variable "ibmcloud_api_key" {
  description = "API key that's associated with the account to use, set via environment variable TF_VAR_ibmcloud_api_key"
  type        = string
  sensitive   = true
}

variable "prefix" {
  description = "Display name of the VPC and prefix for related resources"
  type        = string
  default     = "example-vpc"

}
variable "region" {
  description = "Name of the region to deploy into"
  type        = string
  default     = "us-south"
}

variable "resource_group" {
  type        = string
  description = "A resource group name to use. If not set, a resource group is created."
  default     = null
}

variable "resource_tags" {
  type        = list(string)
  description = "Optional list of tags to add to the created resources"
  default     = []
}
