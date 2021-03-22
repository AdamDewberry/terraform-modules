module "create_state_bucket" {
  source       = "./s3/"
  project_name = var.project_name
  identifier   = var.identifier
}

module "create_lock_table" {
  source       = "./dynamoDB/"
  project_name = var.project_name
  depends_on   = [module.create_state_bucket.external_stage_name]
}
