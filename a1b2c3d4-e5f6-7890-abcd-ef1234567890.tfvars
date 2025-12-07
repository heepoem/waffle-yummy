serviceCode = "sc00008"
serviceGrade = "M"
abbreviation = "renee3"
vnetSubnetName = "sbn-vnet-renee3-01"

agentPoolProfiles = [
  {
    name      = "ssp1"
    mode      = "System"
    vmSize    = "Standard_D8ds_v5"
    count     = 3
    maxPods   = 30
    osDiskType = "Managed"
  },
  {
    name      = "usp1"
    mode      = "User"
    vmSize    = "Standard_D4ds_v5"
    count     = 5
    maxPods   = 110
    osDiskType = "Managed"
  },
  {
    name      = "usp2"
    mode      = "User"
    vmSize    = "Standard_D32ds_v5"
    count     = 5
    maxPods   = 80
    osDiskType = "Ephemeral"
  }
]