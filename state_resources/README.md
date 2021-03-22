# State resources

This module creates the required AWS resources associated with state management.

To deploy include the following resource along with the standard `terraform{}` and `provider` blocks.


Deployment:

    module "state_resources" {
      source       = "github.com/AdamDewberry/terraform-modules//state_resources/"
      project_name = "account-setup"
      identifier   = "your-unique-identifier"
    }

Check your bucket exists and make a note of it's full name with:

    aws s3 ls

Moving the state created into the bucket:

    aws s3 cp terraform.tfstate s3://<project name>-<hashed identifier>-remote-state/state-resources/terraform.tfstate

    aws s3 cp terraform.tfstate.backup s3://<project name>-<hashed identifier>-remote-state/state-resources/terraform.tfstate.backup

Once these are in S3, update your `terraform {}` block with the remote state location:

    terraform {
    ...
        backend "s3" {
          bucket         = "<project name>-<hashed identifier>-remote-state"
          dynamodb_table = "<project name>-lock-table"
          key            = "state-resources/terraform.tfstate"
          region         = <region>
          encrypt        = true
        }
    }
