variable "access_account_name" {
  type        = string
  description = "aviatrix controller access account name"
}

variable "account_email" {
  type        = string
  description = "aviatrix controller access account email"
}

variable "azure_subscription_id" {
  type = string
  description = "Azure subscription ID"
}

variable "azure_application_id" {
  type = string
  description = "Azure app client ID"
}

variable "azure_application_key" {
  type = string
  description = "Azure app client secret value"
}

variable "azure_directory_id" {
  type = string
  description = "Azure app directory ID"
}

# variable "app_name" {
#   type        = string
#   description = "Azure AD App Name for Aviatrix Controller Build Up"
#   default     = "aviatrix_controller_app"
# }

variable "aviatrix_customer_id" {
  type        = string
  description = "aviatrix customer license id"
}

variable "avx_controller_admin_email" {
  type        = string
  description = "aviatrix controller admin email address"
}

variable "avx_controller_admin_password" {
  type        = string
  description = "aviatrix controller admin password"
}

variable "controller_name" {
  type        = string
  description = "Customized Name for Aviatrix Controller"
}
variable "controller_subnet_cidr" {
  type        = string
  description = "CIDR for controller subnet."
}

variable "controller_version" {
  type        = string
  description = "Aviatrix Controller version"
  default     = "latest"
}

variable "controller_virtual_machine_admin_username" {
  type        = string
  description = "Admin Username for the controller virtual machine."
}

variable "controller_virtual_machine_admin_password" {
  type        = string
  description = "Admin Password for the controller virtual machine."
}

variable "controller_virtual_machine_size" {
  type        = string
  description = "Virtual Machine size for the controller."
  default     = "Standard_A4_v2"
}

variable "controller_vnet_cidr" {
  type        = string
  description = "CIDR for controller VNET."
}

variable "create_custom_role" {
  type        = bool
  description = "Enable creation of custom role in stead of using contributor permissions"
  default     = false
}

variable "incoming_ssl_cidr" {
  type        = list(string)
  description = "Incoming cidr for security group used by controller"
  default = ["194.41.109.148/32","4.71.27.2/32","180.166.13.230/32","78.16.112.174/32"]
}

variable "location" {
  type        = string
  description = "Resource Group Location for Aviatrix Controller"
}

variable "copilot_name" {
  type        = string
  description = "Customized Name for Aviatrix Copilot"
}

variable "copilot_virtual_machine_admin_username" {
  type        = string
  description = "Admin Username for the copilot virtual machine"
}

variable "copilot_virtual_machine_admin_password" {
  type        = string
  description = "Admin Password for the copilot virtual machine"
}