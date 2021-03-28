resource "aws_organizations_organization" "organization" {
}

resource "aws_organizations_account" "account" {
  depends_on                 = [aws_organizations_organization.organization]
  for_each                   = var.accounts
  name                       = each.value.name
  email                      = each.value.email
  iam_user_access_to_billing = each.value.iam_user_access_to_billing
  role_name                  = each.value.role_name
  tags                       = each.value.tags
  # lifecycle {
  #   prevent_destroy = true
  # }
}
