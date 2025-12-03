# Terraform variable values for AKS deployment

# Required variables
abbreviation = "cl"
serviceCode = "sc00001"
serviceGrade = "LL"
vnetSubnetName = "default"

# Agent pool profiles configuration
agentPoolProfiles = [
  {
    name       = "systempool1"
    mode       = "System"
    vmSize     = "Standard_D4ds_v5"
    count      = 2
    maxPods    = 110
    osDiskType = "Managed"
  },
  {
    name    = "userpool1"
    mode    = "User"
    vmSize  = "Standard_D8ds_v5"
    count   = 1
    maxPods = 110
  }
]

# Resource group name based on abbreviation
resourceGroupName = "rg-01"

# Virtual network subnet ID
vnetSubnetID = "/subscriptions/c5eb1cc1-00ea-4381-9f3f-5e1c308db920/resourceGroups/poc-rg-prefix-01/providers/Microsoft.Network/virtualNetworks/poc-vn-prefix-01/subnets/default"