

# module "aviatrix_controller_azure" {
#   source             = "./modules/aviatrix_controller_azure"
#   app_name           = var.app_name
#   create_custom_role = var.create_custom_role
# }

module "aviatrix_controller_build" {
  source = "./modules/aviatrix_controller_build"
  // please do not use special characters such as `\/"[]:|<>+=;,?*@&~!#$%^()_{}'` in the controller_name
  controller_name                           = var.controller_name
  location                                  = var.location
  controller_virtual_machine_admin_username = var.controller_virtual_machine_admin_username
  controller_virtual_machine_admin_password = var.controller_virtual_machine_admin_password
  controller_virtual_machine_size           = var.controller_virtual_machine_size
  incoming_ssl_cidr                         = var.incoming_ssl_cidr

  # depends_on = [
  #   module.aviatrix_controller_azure
  # ]
}

module "aviatrix_controller_initialize" {
  source                        = "./modules/aviatrix_controller_initialize"
  avx_controller_public_ip      = module.aviatrix_controller_build.aviatrix_controller_public_ip_address
  avx_controller_private_ip     = module.aviatrix_controller_build.aviatrix_controller_private_ip_address
  avx_controller_admin_email    = var.avx_controller_admin_email
  avx_controller_admin_password = var.avx_controller_admin_password
  arm_subscription_id           = var.azure_subscription_id
  arm_application_id            = var.azure_application_id
  arm_application_key           = var.azure_application_key
  directory_id                  = var.azure_directory_id
  account_email                 = var.account_email
  access_account_name           = var.access_account_name
  aviatrix_customer_id          = var.aviatrix_customer_id
  controller_version            = var.controller_version

  depends_on = [
    module.aviatrix_controller_build
  ]
}

module "copilot_build_azure" {
  source                         = "./modules/az_copilot"
  copilot_name                   = var.copilot_name
  virtual_machine_admin_username = var.copilot_virtual_machine_admin_username
  virtual_machine_admin_password = var.copilot_virtual_machine_admin_password
  controller_name                = var.controller_name
  vnet_cidr                      = var.controller_vnet_cidr
  subnet_cidr                    = var.controller_subnet_cidr
  resource_group_name            = "HCL_AZWEU_Network_Resources"

  allowed_cidrs = {
    "tcp_cidrs" = {
      priority = "100"
      protocol = "tcp"
      ports    = ["443"]
      cidrs    = ["0.0.0.0/0"]
    }
    "udp_cidrs" = {
      priority = "200"
      protocol = "udp"
      ports    = ["5000", "31283"]
      cidrs    = ["0.0.0.0/0"]
    }
  }

  additional_disks = {
    "one" = {
      managed_disk_id = module.copilot_build_azure.disk_id
      lun             = "0"
    }
  }

  depends_on = [
    module.aviatrix_controller_initialize
  ]
}
