terraform {
  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "2.6.0"
    }
  }
}
provider "azapi" {}
resource "azapi_resource" "resourceGroup" {
  type     = "Microsoft.Resources/resourceGroups@2025-04-01"
  name                      = "poc-rg-prefix-${var.abbreviation}-01"
  location                  = "koreacentral"
  schema_validation_enabled = false
  response_export_values    = ["*"]
}
resource "azapi_resource" "ask" {
  type      = "Microsoft.ContainerService/managedClusters@2023-04-02-preview"
  parent_id = azapi_resource.resourceGroup.id
  body = {
    kind = "Base"
    properties = {
      aadProfile = {
        adminGroupObjectIDs = null
        enableAzureRBAC     = true
        managed             = true
        tenantID            = ""
      }
      addonProfiles = {
        azureKeyvaultSecretsProvider = {
          config = {
            enableSecretRotation = "false"
            rotationPollInterval = "2m"
          }
          enabled = true
        }
        azurepolicy = {
          config  = null
          enabled = true
        }
      }
      apiServerAccessProfile = {
        subnetID = "/subscriptions/c5eb1cc1-00ea-4381-9f3f-5e1c308db920/resourceGroups/poc-rg-prefix-01/providers/Microsoft.Network/virtualNetworks/poc-vn-prefix-01/subnets/${var.vnetSubnetName}"
      }
      agentPoolProfiles = [for n in var.agentPoolProfiles : {
        availabilityZones      = ["1", "2", "3"]
        count                  = n.count
        enableAutoScaling      = false
        enableEncryptionAtHost = true
        maxPods                = n.maxPods
        mode                   = n.mode
        name                   = n.name
        osDiskType             = "Ephemeral"
        osSKU                  = "Ubuntu"
        vmSize       = n.vmSize
        vnetSubnetID = "/subscriptions/c5eb1cc1-00ea-4381-9f3f-5e1c308db920/resourceGroups/poc-rg-prefix-01/providers/Microsoft.Network/virtualNetworks/poc-vn-prefix-01/subnets/${var.vnetSubnetName}"
        }]
      dnsPrefix            = "poc-aks-prefix-${abbreviation}-01-${azapi_resource.resourceGroup.Name}"
      enableRBAC           = true
      ingressProfile = {
        webAppRouting = {
          dnsZoneResourceIds = null
          enabled            = true
          nginx = {
            defaultIngressControllerType = "internal"
          }
        }
      }
      metricsProfile = {
        costAnalysis = {
          enabled = false
        }
      }
      oidcIssuerProfile = {
        enabled = true
      }
      securityProfile = {
        workloadIdentity = {
          enabled = true
        }
      }
      servicePrincipalProfile = {
        clientId = "msi"
      }
      storageProfile = {
        blobCSIDriver = {
          enabled = true
        }
        diskCSIDriver = {
          enabled = true
          version = "v1"
        }
        fileCSIDriver = {
          enabled = true
        }
        snapshotController = {
          enabled = true
        }
      }
      supportPlan = "KubernetesOfficial"
    }
    sku = {
      name = "Base"
      tier = "Standard"
    }
  }
  ignore_casing             = false
  ignore_null_property      = false
  location                  = "koreacentral"
  name                      = "poc-aks-prefix-${abbreviation}-01"
  schema_validation_enabled = true
  tags = {
    Environment   = "dev"
    ProvisionedBy = "Terraform"
    Service       = var.serviceCode
    ServiceGrade  = var.serviceGrade
    name          = self.name
  }
}
