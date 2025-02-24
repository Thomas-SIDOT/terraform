terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}


provider "docker" {}

module "nginx-containers" {
  source         = "./modules/nginx-containers"
  cont_image = "nginx"
  cont_mem = 512
  cont_priv = false
  cont_nb = 4
  cont_port = 3000
}

output "nginx_containers" {
  value = module.nginx-containers.container_names
}

output "nginx_ports" {
  value = module.nginx-containers.container_ports
}