# Terraform Variables Configuration for AKS Deployment

# Required variable values
serviceCode = "sc7000"
serviceGrade = "C"
abbreviation = "mag"
vnetSubnetName = "default"

# Processed agentPoolProfiles structure derived from CSV inputs
agentPoolProfiles = [
  {
    name      = "nodepool1"
    mode      = "System"
    vmSize    = "Standard_D8ds_v5"
    count     = 30
    maxPods   = 110
    osDiskType = "Managed"
  },
  {
    name      = "nodepool2"
    mode      = "User"
    vmSize    = "Standard_D4ds_v5"
    count     = 50
    maxPods   = 110
    osDiskType = "Managed"
  }
]