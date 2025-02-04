resource "azurerm_network_interface" "nic" {
  name                = "${var.application_type}-${var.resource_type}-NIC"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id_test}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip_address_id}"
  }
}

resource "azurerm_linux_virtual_machine" "myvm" {
  name                = "${var.application_type}-${var.resource_type}-VM"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "Standard_DS1"
  admin_username = "azureuser"
  network_interface_ids = [azurerm_network_interface.nic.id]
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/Vmkey.pub")
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
