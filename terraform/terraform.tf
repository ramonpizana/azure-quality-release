terraform {

required_version = ">=0.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }

  }

backend "azurerm" {
    resource_group_name  = "rg-terraform"
    storage_account_name = "tstate15137"
    container_name       = "tstate-act5"
    key                  = "terraform.tfstate"
    access_key           = "n5Sp72zqCzaOOWI1NQ3LUMzouLZfr+gmhc6/jgBEJyU40hR/zz1+Kg1MRMMAjcRNQQDhLnGVKTNpfbKhOfgHMg=="
  }
}