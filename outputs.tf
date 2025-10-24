output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "ubuntu_ip_address" {
  value = azurerm_linux_virtual_machine.ubuntu_vm.public_ip_address
}
