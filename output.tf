 output "vm_id" {
  value = proxmox_vm_qemu.debian_clone.vmid
}

# Supprime ou commente le bloc ci-dessous :
# output "ip_address" {
#   value = proxmox_vm_qemu.debian_clone.network.0.ip
# }

# Optionnel : affiche juste le nom et l’état de la VM
output "vm_name" {
  value = proxmox_vm_qemu.debian_clone.name
}
