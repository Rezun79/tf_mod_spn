
data "azuread_service_principal" "example" {
  object_id = azuread_application.example.application_id
}
output "spn_id" {
  object_id = data.azuread_service_principal.example.application_id
}

output "spn_secret" {
    value = azuread_service_principal_password.example.value
}