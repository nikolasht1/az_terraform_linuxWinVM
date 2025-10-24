#!/bin/bash

echo "Starting safe Terraform cleanup..."

# Step 1: Destroy VMs
echo "Destroying virtual machines..."
terraform destroy -target=azurerm_linux_virtual_machine.ubuntu_vm["vm1"] \
                  -target=azurerm_linux_virtual_machine.ubuntu_vm["vm2"] \
                  -target=azurerm_linux_virtual_machine.ubuntu_vm["vm3"] \
                  -target=azurerm_linux_virtual_machine.ubuntu_vm["vm4"] -auto-approve

# Step 2: Destroy NIC Security Group Associations
echo "Destroying NIC security group associations..."
terraform destroy -target=azurerm_network_interface_security_group_association.ubuntu_nsg_assoc["vm1"] \
                  -target=azurerm_network_interface_security_group_association.ubuntu_nsg_assoc["vm2"] \
                  -target=azurerm_network_interface_security_group_association.ubuntu_nsg_assoc["vm3"] \
                  -target=azurerm_network_interface_security_group_association.ubuntu_nsg_assoc["vm4"] -auto-approve

# Step 3: Destroy NICs and Public IPs
echo "Destroying NICs and public IPs..."
terraform destroy -target=azurerm_network_interface.ubuntu_nic["vm1"] \
                  -target=azurerm_network_interface.ubuntu_nic["vm2"] \
                  -target=azurerm_network_interface.ubuntu_nic["vm3"] \
                  -target=azurerm_network_interface.ubuntu_nic["vm4"] \
                  -target=azurerm_public_ip.ubuntu_ip["vm1"] \
                  -target=azurerm_public_ip.ubuntu_ip["vm2"] \
                  -target=azurerm_public_ip.ubuntu_ip["vm3"] \
                  -target=azurerm_public_ip.ubuntu_ip["vm4"] -auto-approve

# Step 4: Destroy NSG, Subnet, and VNet
echo "Destroying NSG, subnet, and virtual network..."
terraform destroy -target=azurerm_network_security_group.my_terraform_nsg \
                  -target=azurerm_subnet.my_terraform_subnet \
                  -target=azurerm_virtual_network.my_terraform_network -auto-approve

# Step 5: Destroy Resource Group and Random Generators
echo "Destroying resource group and random generators..."
terraform destroy -target=azurerm_resource_group.rg \
                  -target=random_pet.rg_name \
                  -target=random_id.random_id -auto-approve

# Final Step: Clean up remaining resources
echo "Final cleanup of any remaining resources..."
terraform destroy -auto-approve

echo "✅ Terraform cleanup complete!"
