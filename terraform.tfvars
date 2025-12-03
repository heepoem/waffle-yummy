# Terraform variables for AKS deployment

# Service code identifier (internal)
serviceCode = "sc00001"

# Service grade/tier (e.g., L)
serviceGrade = "LL"

# A word used as Infix or suffix in names of resources
abbreviation = "renee2"

# The name of the target subnet to attach the AKS cluster
vnetSubnetName = "default"

# List of AKS agent pool profiles
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