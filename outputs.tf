output "avx_controller_public_ip" {
  value = module.aviatrix_controller_build.aviatrix_controller_public_ip_address
}

output "avx_controller_private_ip" {
  value = module.aviatrix_controller_build.aviatrix_controller_private_ip_address
}

output "avx_copilot_public_ip" {
  value = module.copilot_build_azure.public_ip
}