variable "env" {
  type        = string
  description = "環境"
}

variable "service" {
  type        = string
  description = "サービス名"
}

variable "availability_zones" {
  type    = list(string)
}

variable "subnet_count" {
  type    = number
}