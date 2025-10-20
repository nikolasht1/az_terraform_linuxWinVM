output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "ubuntu_ip_address" {
  value = azurerm_linux_virtual_machine.ubuntu_vm.public_ip_address
}

output "windows_ip_address" {
  value = azurerm_windows_virtual_machine.windows_vm.public_ip_address
}

output "admin_password" {
  sensitive = true
  value     = azurerm_windows_virtual_machine.windows_vm.admin_password
}