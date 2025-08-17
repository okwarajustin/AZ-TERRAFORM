
resource "azurerm_resource_group" "rg" {
  name     = var.rg
  location = var.region
}
resource "azurerm_resource_group" "rg-resources" {
  name     = "rg-resources"
  location = var.location
}

resource "azurerm_virtual_network" "rg-network" {
  name                = "rg-network"
  address_space       = var.address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "rg-sub" {
  name                 = "sub-internal"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.rg-network.name
  address_prefixes     = var.subnet_prefix
}

resource "azurerm_network_interface" "net-interface" {
  name                = "net-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "sub-internal"
    subnet_id                     = azurerm_subnet.rg-sub.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "virtual-machine-linux" {
  name                = "virtual-machine-linux-${var.vm_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.vm_size
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.net-interface.id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.admin_ssh_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher    # e.g., "Canonical"
    offer     = var.image_offer        # e.g., "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = var.image_version      # e.g., "latest"
  }
}


# resource "azurerm_resource_group" "backend_rg" {
#   name     = "terraform-rg"
#   location = "East US"
# }

# resource "azurerm_storage_account" "mystorageforbackend" {
#   name                     = "mystorageforbackend1234" # Must be globally unique
#   resource_group_name      = azurerm_resource_group.backend_rg.name
#   location                 = azurerm_resource_group.backend_rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   min_tls_version          = "TLS1_2"
# }

# resource "azurerm_storage_container" "mycontainer" {
#   name                  = "mycontainer"
#   storage_account_id    = azurerm_storage_account.mystorageforbackend.id
#   container_access_type = "private"
# }