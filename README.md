# terraform-modules

Deployment:

    module "state_resources" {
      source       = "github.com/AdamDewberry/terraform-modules//state_resources/"
      project_name = "account-setup"
      identifier   = "your-unique-identifier"
    }
