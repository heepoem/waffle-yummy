// AKS agent pool profiles
variable "agentPoolProfiles" {
 description = "List of AKS agent pool profiles"
 type = list(object({
   name      = string           // e.g. "systempool1", "userpool1"
   mode      = string           // "System" or "User"
   vmSize    = string           // e.g. "Standard_D4ds_v5"
   count     = number           // node count
   maxPods   = number           // max pods per node
   osDiskType = optional(string) // e.g. "Managed", "Ephemeral" (optional)
 }))
 // (권장) mode 값 검증
 validation {
   condition    = alltrue([for p in var.agentPoolProfiles : contains(["System", "User"], p.mode)])
   error_message = "agentPoolProfiles[*].mode must be either \"System\" or \"User\"."
 }
}
// Cluster-wide settings
variable "clusterName" {
 description = "AKS cluster name"
 type       = string
}
variable "serviceCode" {
 description = "Service code identifier (internal)"
 type       = string
}
variable "serviceGrade" {
 description = "Service grade/tier (e.g., L)"
 type       = string
}
variable "resourceGroupName" {
 description = "Resource group name for the AKS cluster"
 type       = string
}
variable "vnetSubnetID" {
 description = "Full resource ID of the target subnet to attach the AKS cluster"
 type       = string
 // 간단한 형식 검증(구독/리소스그룹/프로바이더 포함)
 validation {
   condition = can(regex("^/subscriptions/[0-9a-fA-F-]+/resourceGroups/.+/providers/Microsoft\\.Network/virtualNetworks/.+/subnets/.+$", var.vnetSubnetID))
   error_message = "vnetSubnetID must be a valid subnet resource ID, e.g. /subscriptions/<subId>/resourceGroups/<rg>/providers/Microsoft.Network/virtualNetworks/<vnet>/subnets/<subnet>."
 }
}
