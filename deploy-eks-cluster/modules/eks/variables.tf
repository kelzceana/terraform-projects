variable "public_subnet_id" {
  description = "List of subnet IDs to use for the EKS cluster"
  type        = string
}
variable "private_subnet_id" {
  description = "List of subnet IDs to use for the EKS cluster"
  type        = string
}