# Terraform variables configuration for Azure Kubernetes Service (AKS)

# Required Variables
abbreviation = "abbr2" # A word used as Infix or suffix in names of resources
serviceCode = "sc33838" # Service code identifier (internal)
serviceGrade = "D" # Service grade/tier (e.g., L)
vnetSubnetName = "sbn-vnet-abbr2-01" # The name of the target subnet to attach the AKS cluster

# Agent Pool Profiles
agentPoolProfiles = [
  {
    name      = "sp1"                # Name of the agent pool
    mode      = "System"             # Mode of the agent pool (System or User)
    vmSize    = "Standard_D32ds_v5"  # VM size for this agent pool
    count     = 3                    # Number of nodes in this agent pool
    maxPods   = 15                   # Maximum pods per node
    osDiskType = "Managed"           # Type of disk to use (optional)
  },
  {
    name      = "up1"                # Name of the agent pool
    mode      = "User"               # Mode of the agent pool (System or User)
    vmSize    = "Standard_D8ds_v5"   # VM size for this agent pool
    count     = 30                   # Number of nodes in this agent pool
    maxPods   = 110                  # Maximum pods per node
    osDiskType = "Managed"           # Type of disk to use (optional)
  }
]