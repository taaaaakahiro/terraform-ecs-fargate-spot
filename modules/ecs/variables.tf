variable "env" {
  type        = string
  description = "環境"
}

variable "service" {
  type        = string
  description = "サービス名"
}

variable "private_subnet_ids" {
    type = list
}

variable "security_group_id" {
    type = string
}

variable "alb_target_group_arn" {
    type = string
}

variable "ecr_repository_uri" {
    type = string
}