terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = true
  pm_parallel         = 1
}

resource "proxmox_vm_qemu" "debian_clone" {
  name        = var.hostname
  target_node = "snowden"
  clone       = "debian-cloud-template"
  full_clone  = true

  agent    = 1
  cores    = 2
  sockets  = 1
  memory   = 2048
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    size    = "10G"
    type    = "scsi"
    storage = "Truenas"
  }

  network {
    model  = "virtio"
    bridge = var.bridge
  }

  # Configuration réseau via Cloud-Init
  ipconfig0 = "ip=dhcp"

  # Cloud-Init : utilisateur + mot de passe injectés depuis Flask
  ciuser     = var.username
  cipassword = var.password
  sshkeys    = var.ssh_key

  tags = "auto,flask"

  # Démarrage automatique
  oncreate = true
  onboot   = true
  startup  = "order=1,up=30"
}
