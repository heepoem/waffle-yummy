# Terraform variables for AKS deployment
serviceCode = "sc00001"
serviceGrade = "LL"
abbreviation = "renee"
vnetSubnetName = "default"

# Agent pool profiles configuration
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
    osDiskType = null
  }
]