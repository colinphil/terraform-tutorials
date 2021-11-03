variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "s3_name" {
  description = "Value of the name for the S3 bucket"
  type        = string
  default     = "example-app-server-s3-bucket"
}

variable "s3_tag_name" {
  description = "Value of the Name tag for the S3 bucket"
  type        = string
  default     = "ExampleAppServerS3Bucket"
}
