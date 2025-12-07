# Validated and organized set of input parameters for Terraform AKS configuration

# All Terraform variables properly formatted and validated
abbreviation = "renee"
serviceCode = "sc384738"
serviceGrade = "D"
vnetSubnetName = "sbn-vnet-default-renee-01"

# Constructed agentPoolProfiles array from individual properties
agentPoolProfiles = [
  {
    name     = "sp1"
    mode     = "System"
    vmSize   = "Standard_D8ds_v5"
    count    = 3
    maxPods  = 30
    osDiskType = "Managed"
  },
  {
    name     = "up1"
    mode     = "User"
    vmSize   = "Standard_D32ds_v5"
    count    = 15
    maxPods  = 110
    osDiskType = "Managed"
  }
]

# Confirmation that all required values are present and correctly formatted
# Required values are present:
# - agentPoolProfiles: 2 profiles defined
# - abbreviation: "renee"
# - serviceCode: "sc384738"
# - serviceGrade: "D"
# - vnetSubnetName: "sbn-vnet-default-renee-01"

# The configuration is now ready for tfvars generation.