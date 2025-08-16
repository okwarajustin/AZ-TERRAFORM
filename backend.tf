
terraform {
  backend "azurerm" {
    storage_account_name = "mystorageforbackend123"
    subscription_id      = "4f280b52-14a6-4c07-9f6f-2b41c444db28"
    resource_group_name  = "RG"      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "mycontainer"       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
