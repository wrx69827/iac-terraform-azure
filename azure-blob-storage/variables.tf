variable "group" {
  type = string
  default = "My Resource Group"
}

variable "account" {
  type = string
  default = "My Storage Account"
}

variable "my_area" {
  type = string
  default = "Europe"
}

variable "tier" {
  type = string
  default = "Standard"
}

variable "replication_type" {
  type = string
  default = "GRS"
}

variable "container_name" {
  type = string
  default = "vhds"
}

variable "storage_name" {
  type = string
  default = "private"
}

variable "storage_content" {
  type = string
  default = "my-awesome-content.zip"
}

variable "type" {
  type = string
  default = "Block"
}

variable "source" {
  type = string
  default = "some-local-file.zip"
}
