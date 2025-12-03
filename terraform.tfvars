serviceCode = "sc00001"

serviceGrade = "LL"

agentPoolProfiles = [
  {
    name      = "systempool1"
    mode      = "System"
    vmSize    = "Standard_D4ds_v5"
    count     = 2
    maxPods   = 110
    osDiskType = "Managed"
  },
  {
    name      = "userpool1"
    mode      = "User"
    vmSize    = "Standard_D8ds_v5"
    count     = 1
    maxPods   = 110
  }
]

abbreviation = "renee"

vnetSubnetName = "default"