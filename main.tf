terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

variable "cont_image" {
  type    = string
  default = "nginx"
}
variable "cont_nb" {
  type    = number
  default = 4
}
variable "cont_mem" {
  type    = number
  default = 512
}
variable "cont_priv" {
  type    = bool
  default = false
}


provider "docker" {}

resource "docker_image" "nginx" {
  name         = "${var.cont_image}:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  count = var.cont_nb
  memory = var.cont_mem
  image = docker_image.nginx.image_id
  privileged = var.cont_priv
  name  = "server_${count.index}"
  ports {
    internal = 80
    external = 3000+count.index
  }
}

