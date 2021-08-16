provider "azurerm" {
    version = 1.38
}

resource "azurerm_storage_account" "lab" {
    name                     = "storage4terraformlabaud1"
    resource_group_name      = "156-58040b18-deploy-an-azure-storage-account-with"
    location                 = "East US"
    account_tier            = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "Terraform Storage"
        CreatedBy = "Admin"
    }
}