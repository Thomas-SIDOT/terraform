output "container_names" {
  description = "Noms des conteneurs créés"
  value       = [for c in docker_container.nginx : c.name]
}

output "container_ports" {
  description = "Ports accessibles"
  value       = [for c in docker_container.nginx : c.ports[0].external]
}