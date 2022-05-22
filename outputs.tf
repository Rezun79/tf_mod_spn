
data "azuread_service_principal" "rg_spn" {
  object_id = azuread_service_principal.rg_spn.object_id
}
output "spn_object_id" {
  value = data.azuread_service_principal.rg_spn.object_id
}
output "spn_client_id" {
  value = data.azuread_service_principal.rg_spn.application_id
}
# output "spn_secret" {
#     value = azuread_service_principal_password.rg_spn.value
# }

output "secret" {
    value = azuread_application_password.rg_spn.value
}