variable "project_name" {
  default     = "account-setup"
  description = "Project and domain used in resource name interpolation"
}

variable "identifier" {
  description = "A unique identifier which is hashed and truncated to ensure S3 bucket name uniqueness"
}
