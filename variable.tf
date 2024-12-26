variable "Environment" {
  description = "tag_environment"
  default = "Production"
}

variable "Project" {
  description = "tag_project"
  default = "registry"
}

variable "name" {
  description = "name"
  default = "private-registry-bucket"
}

variable "permission" {
  description = "permision to user"
  default = "READ"
}