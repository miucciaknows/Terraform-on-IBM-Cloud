output "crn" {
  value       = module.vpc.vpc_id
  description = "VPC id"
}

output "vpc" {
  value       = module.vpc
  description = "VPC"
}
