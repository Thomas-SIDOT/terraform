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
variable "cont_port" {
  type    = number
  default = 3000
}