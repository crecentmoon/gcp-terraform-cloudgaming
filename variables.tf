variable "project" {
  description = "The GCP project to deploy to"
  type        = string
  default     = "calovox-dev"
}

variable "region" {
  description = "The location/region of the resource"
  type        = string
  default     = "ap-nottheast1"
}