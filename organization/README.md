# Organization and account creation

This module will activate the AWS organization feature and create AWS accounts based on the map input, as follows:

    locals {
      accounts = {
        dev = {
          name                       = "PROJECT_DEV",
          email                      = "PROJECT_DEV@mail.com",
          iam_user_access_to_billing = "ALLOW"
          role_name                  = "Admin"
          tags = {
            "environment" = "DEV"
          }
        }
        staging = {
          name                       = "PROJECT_STAGING",
          email                      = "PROJECT_STAGING@mail.com",
          iam_user_access_to_billing = "ALLOW"
          role_name                  = "Admin"
          tags = {
            "environment" = "STAGING"
          }
        }
        prod = {
          name                       = "PROJECT_PROD",
          email                      = "PROJECT_PROD@mail.com",
          iam_user_access_to_billing = "ALLOW"
          role_name                  = "Admin"
          tags = {
            "environment" = "PROD"
          }
        }
      }
    }

## Import exiting accounts

    terraform import 'module.accounts.aws_organizations_organization.organization' o-o4k9zkqcm7

    terraform import 'module.accounts.aws_organizations_account.account["data_engineering_101"]' 930933631653
