data "azuread_client_config" "current" {}

resource "azuread_application" "rg_spn" {
  display_name = "${local.rg_name}_spn"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "rg_spn" {
  application_id               = azuread_application.rg_spn.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}
# resource "azuread_service_principal_password" "example" {
#   service_principal_id = azuread_service_principal.example.object_id
# }

# How to add SPN password https://stackoverflow.com/questions/69615473/how-to-create-a-client-secret-using-terraform 
resource "azuread_application_password" "rg_spn" {
  display_name = "${local.rg_name}_spn_secret"
  application_object_id = azuread_application.rg_spn.object_id
}