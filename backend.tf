
# terraform {
#   backend "azurerm" {
#     storage_account_name = "mystorageforbackend"
#     resource_group_name  = "terraform-rg"      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
#     container_name       = "mycontainer"       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
#     key                  = "terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
#   }
# }
