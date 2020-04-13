variable "vpc_id" {
    description = "VPC ID"
    type        = string
}

variable "allowed_cidr" {
  description = "A list of ip range to allow access to."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}