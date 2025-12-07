abbreviation = "renee"
serviceCode = "sc384739"
serviceGrade = "L"
vnetSubnetName = "sbn-vnet-default-renee-02"
agentPoolProfiles = [
  {
    name     = "spool1"
    mode     = "System"
    vmSize   = "Standard_D4ds_v5"
    count    = 3
    maxPods  = 30
  },
  {
    name     = "upool1"
    mode     = "User"
    vmSize   = "Standard_D8ds_v5"
    count    = 15
    maxPods  = 90
  }
]
osDiskType = "Managed"