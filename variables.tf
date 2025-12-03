/ AKS agent pool profiles
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
variable "abbreviation" {
 description = "A word used as Infix or suffix in names of resources is supposed to be installed"
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
variable "vnetSubnetName" {
 description = "The name of the target subnet to attach the AKS cluster"
 type       = string
}
