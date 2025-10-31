variable "hostname" {
  description = "Nom de la VM"
}

variable "username" {
  description = "Nom de l'utilisateur de la VM"
}

variable "password" {
  description = "Mot de passe de l'utilisateur"
}

variable "ssh_key" {
  description = "Clé publique SSH facultative"
  default     = ""
}

variable "pm_api_url" {}
variable "pm_api_token_id" {}
variable "pm_api_token_secret" {}

variable "bridge" {
  default = "vmbr0"
}
