abbreviation = "renee4"
serviceCode = "sc00009"
serviceGrade = "D"
vnetSubnetName = "sbn-vnet-renee4-01"

agentPoolProfiles = [
  {
    name      = "ssp1"
    mode      = "system"
    vmSize    = "Standard_D8ds_v5"
    count     = 3
    maxPods   = 30
    osDiskType = "Managed"
  },
  {
    name      = "usp1"
    mode      = "user"
    vmSize    = "Standard_D4ds_v5"
    count     = 5
    maxPods   = 110
    osDiskType = "Managed"
  },
  {
    name      = "usp3"
    mode      = "user"
    vmSize    = "Standard_D32ds_v5"
    count     = 15
    maxPods   = 80
    osDiskType = "Ephemeral"
  }
]