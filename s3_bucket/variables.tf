variable "region" {
  description = "AWS Region "
  default     = "ap-southeast-1"
}


variable "s3_bucket" {
  description = "s3 bucket name "
  type        = list

}

variable "log_bucket" {
  description = "log bucket name "


}

variable "log_bucket_target_prefix" {
  description = "log bucket target prefix "

}

variable "create_log_bucket" {
  description = "log bucket enable "

}

#Tags
variable "project" {
  default = "Terraform Project"
}

variable "spoc" {
  default = "Terraform SPOC"
}
variable "created_date" {
  default = "5/26/2020"
}

variable "versioning" {
  type    = bool
  default = "false"

}

variable "lifecycle_rule" {
  type    = bool
  default = "false"
}

variable "sse_algorithm" {
  description = "Encryption algorithm used for this bucket"
  default     = "AES256"
  type        = string
}