variable "location" {
  type        = string
  description = "Resource Group Location for Aviatrix Copilot"
  default     = "West Europe"
}

variable "copilot_name" {
  type        = string
  description = "Customized Name for Aviatrix Copilot"
}

variable "controller_name" {
  type        = string
  description = "Customized Name for Aviatrix Controller"
}

variable "vnet_cidr" {
  type        = string
  description = "CIDR for copilot VNET"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR for copilot subnet"
}

variable use_existing_vnet {
  type        = bool
  description = "Flag to indicate whether to use an existing VNET"
  default     = true
}

variable "resource_group_name" {
  description = "Resource group name, only required when use_existing_vnet is true"
  default = "HCL_AZWEU_Network_Resources"
}

variable "virtual_machine_admin_username" {
  type        = string
  description = "Admin Username for the copilot virtual machine"
}

variable "virtual_machine_admin_password" {
  type        = string
  description = "Admin Password for the copilot virtual machine"
}

variable "virtual_machine_size" {
  type        = string
  description = "Virtual Machine size for the copilot"
  default     = "Standard_A4_v2"
}

variable allowed_cidrs {
  type = map(object({
    priority = string,
    protocol = string,
    ports    = set(string),
    cidrs    = set(string),
  }))
}

variable "os_disk_name" {
  type        = string
  default     = ""
  description = "OS disk name of the copilot virtual machine"
}

variable additional_disks {
  default = {}
  type = map(object({
    managed_disk_id = string,
    lun = string,
  }))
}
