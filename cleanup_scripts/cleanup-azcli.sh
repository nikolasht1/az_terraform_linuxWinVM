#!/bin/bash

# Set variables
RESOURCE_GROUP=$(az group list --query "[?starts_with(name, 'your-prefix')].name" -o tsv)

echo "Using resource group: $RESOURCE_GROUP"

# Step 1: Delete virtual machines
echo "Deleting virtual machines..."
for i in 1 2 3 4; do
  az vm delete --name "ubuntuVM-$i" --resource-group "$RESOURCE_GROUP" --yes --no-wait
done

# Step 2: Delete NICs
echo "Deleting network interfaces..."
for i in 1 2 3 4; do
  az network nic delete --name "ubuntuNIC-$i" --resource-group "$RESOURCE_GROUP"
done

# Step 3: Delete public IPs
echo "Deleting public IPs..."
for i in 1 2 3 4; do
  az network public-ip delete --name "ubuntuVM-$i-public-ip" --resource-group "$RESOURCE_GROUP"
done

# Step 4: Delete NSG
echo "Deleting Network Security Group..."
az network nsg delete --name "LinuxNetworkSecurityGroup" --resource-group "$RESOURCE_GROUP"

# Step 5: Delete subnet and virtual network
echo "Deleting subnet and virtual network..."
az network vnet subnet delete --name "LinuxSubnet" --vnet-name "LinuxVnet" --resource-group "$RESOURCE_GROUP"
az network vnet delete --name "LinuxVnet" --resource-group "$RESOURCE_GROUP"

# Step 6: Delete resource group
echo "Deleting resource group..."
az group delete --name "$RESOURCE_GROUP" --yes --no-wait

echo "✅ Azure CLI cleanup complete!"
