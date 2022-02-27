variable "location" {
  type        = string
  description = "Resource Group Location for Aviatrix Controller"
  default     = "westeurope"
}

variable "controller_name" {
  type        = string
  description = "Customized Name for Aviatrix Controller"
}

variable "resource_group_name" {
  type = string
  description = "Existing Resource group name"
  default = "HCL_AZWEU_Network_Resources"
}

variable "controller_virtual_machine_admin_username" {
  type        = string
  description = "Admin Username for the controller virtual machine."
  default     = ""
}

variable "controller_virtual_machine_admin_password" {
  type        = string
  description = "Admin Password for the controller virtual machine."
  default     = ""
}

variable "controller_virtual_machine_size" {
  type        = string
  description = "Virtual Machine size for the controller."
  default     = "Standard_A4_v2"
}

variable "incoming_ssl_cidr" {
  type        = list(string)
  description = "Incoming cidr for security group used by controller"
}