clusterName = "cl-01"
serviceCode = "sc00001"
serviceGrade = "LL"
resourceGroupName = "rg-01"
vnetSubnetID = "/subscriptions/c5eb1cc1-00ea-4381-9f3f-5e1c308db920/resourceGroups/poc-rg-prefix-01/providers/Microsoft.Network/virtualNetworks/poc-vn-prefix-01/subnets/default"
agentPoolProfiles = [
  {
    name      = "systempool1"
    mode      = "System"
    vmSize    = "Standard_D4ds_v5"
    count     = 2
    maxPods   = 110
  },
  {
    name      = "userpool1"
    mode      = "User"
    vmSize    = "Standard_D8ds_v5"
    count     = 1
    maxPods   = 110
  }
]