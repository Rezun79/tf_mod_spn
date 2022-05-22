
data "azuread_service_principal" "example" {
  application_id = azuread_application.example.application_id
}
output "spn_id" {
  value = data.azuread_service_principal.example.application_id
}

output "spn_secret" {
    value = azuread_service_principal_password.example.value
}