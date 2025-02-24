terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

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
    external = var.cont_port+count.index
  }
}