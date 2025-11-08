variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
}
variable "env" {
  description = "Environment name"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}