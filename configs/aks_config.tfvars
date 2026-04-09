# Terraform Variables
abbreviation = "abbr2" 
serviceCode = "sc33838" 
serviceGrade = "D"
vnetSubnetName = "sbn-vnet-abbr2-01"

# Agent Pool Profiles
agentPoolProfiles = [
  {
    name     = "sp1"
    mode     = "System"
    vmSize   = "Standard_D32ds_v5"
    count    = 3
    maxPods  = 30
    osDiskType = "Managed"
  },
  {
    name     = "up1"
    mode     = "User"
    vmSize   = "Standard_D8ds_v5"
    count    = 15
    maxPods  = 110
    osDiskType = "Managed"
  }
]