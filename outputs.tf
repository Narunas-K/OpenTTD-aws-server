output "openttd_public_ip" {
    description = "Open TTD server public IP"
    value = module.opentdd-server.public_ip
}