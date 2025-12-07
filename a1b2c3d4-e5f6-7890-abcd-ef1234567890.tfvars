serviceCode = "sc00007"
serviceGrade = "M"
abbreviation = "renee3"
vnetSubnetName = "default"

agentPoolProfiles = [
  {
    name      = "ss1"
    mode      = "System"
    vmSize    = "Standard_D8ds_v5"
    count     = 3
    maxPods   = 30
    osDiskType = "Managed"
  },
  {
    name      = "us1"
    mode      = "User"
    vmSize    = "Standard_D4ds_v5"
    count     = 5
    maxPods   = 40
    osDiskType = "Managed"
  },
  {
    name      = "us2"
    mode      = "User"
    vmSize    = "Standard_D32ds_v5"
    count     = 5
    maxPods   = 80
    osDiskType = "Managed"
  },
]