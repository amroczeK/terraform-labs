provider "azurerm" {
    version = 1.38
}
    
resource "azurerm_storage_account" "lab" {
  name                     = "adrstorage1"
  resource_group_name      = "183-2b5f0e38-deploy-an-azure-file-share-with-terra"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "lab" {
  name                  = "adrblobcontainer1"
  storage_account_name  = azurerm_storage_account.lab.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "lab" {
  name                   = "adrblob"
  storage_account_name   = azurerm_storage_account.lab.name
  storage_container_name = azurerm_storage_container.lab.name
  type                   = "Block"
}
resource "azurerm_storage_share" "lab" {
  name                 = "adrstorageshare"  
  storage_account_name = azurerm_storage_account.lab.name
  quota                = 50
}