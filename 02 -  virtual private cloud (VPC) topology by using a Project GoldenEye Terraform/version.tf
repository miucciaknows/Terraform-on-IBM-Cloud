terraform {
  required_version = ">= 1.3.0, <1.6.0"
  required_providers {
    ibm = {
      source = "ibm-cloud/ibm"
      # Lock into lowest version in example to ensure we don't end up with invalid lower range
      version = "1.54.0"
    }
  }
}
