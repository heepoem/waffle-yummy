# Terraform Variables for Azure Kubernetes Service Deployment

# 1. Resource Group Name
resource_group_name = "my-resource-group"  # The name of your Azure resource group

# 2. Location
location = "eastus"  # Azure region where the resources will be deployed

# 3. AKS Cluster Name
aks_cluster_name = "my-aks-cluster"  # Name of the Azure Kubernetes Service cluster

# 4. Kubernetes Version
kubernetes_version = "1.21.2"  # Desired version of Kubernetes for the AKS cluster

# 5. Node Count
node_count = 3  # Number of nodes in the AKS cluster

# 6. Node VM Size
node_vm_size = "Standard_DS2_v2"  # VM size for the nodes

# 7. DNS Name Prefix
dns_name_prefix = "myaks"  # DNS name prefix for the AKS cluster

# 8. Service Principal Client ID
service_principal_client_id = "your-client-id"  # Azure Service Principal Client ID

# 9. Service Principal Client Secret
service_principal_client_secret = "your-client-secret"  # Azure Service Principal Client Secret

# 10. Network Plugin
network_plugin = "azure"  # Network plugin type, options include 'azure' or 'kubenet'

# 11. Enable RBAC
enable_rbac = true  # Enable Role-Based Access Control (RBAC)

# 12. AAD Integration
aad_integration = false  # Enable Azure Active Directory integration

# 13. Enable Monitoring
enable_monitoring = true  # Enable monitoring for the AKS cluster

# 14. Tags
tags = jsonencode({"environment": "dev", "project": "aks-deployment"})  # Tags for resource management

# 15. Network Policy
network_policy = "calico"  # Network policy type, options include 'calico' or 'none'