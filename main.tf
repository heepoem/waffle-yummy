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
  name                      = var.resourceGroupName
  location                  = var.location
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
        subnetID = var.vnetSubnetID
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
        vnetSubnetID = var.vnetSubnetID
        }]
      dnsPrefix            = "${var.name}-${var.resourceGroupName}"
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
  name                      = var.clusterName
  schema_validation_enabled = true
  tags = {
    Environment   = "dev"
    ProvisionedBy = "Terraform"
    Service       = var.serviceCode
    ServiceGrade  = var.serviceGrade
    name          = var.clusterName
  }
}
