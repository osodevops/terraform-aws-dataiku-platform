module "codebuild_base_containers" {
  source = "./terraform/modules/codebuild-packer"
  # source                     = "osodevops/dataiku-dss/codebuild-packer#123456"
  additional_build_variables = local.container_additional_build_variables
  ami_post_build_commands    = ["echo Container build complete"]
  build_timeout              = var.build_timeout
  instance_type              = var.packer_instance_type
  packer_file_location       = "packer/base-containers.json"
  project_name               = var.project_name
  region                     = var.aws_region
  source_image_account_no    = var.source_image_account_no
  source_repository_url      = var.source_repository_url
  subnet_name_filter         = var.build_subnet_name_filter
  vpc_name                   = var.vpc_name
  github_api_token           = data.aws_ssm_parameter.github_pat.value # Uncomment to provide PAT from Parameter Store
  # github_api_token           = data.vault_generic_secret.github_pat  # Uncomment to provide PAT from Vault
}

resource "aws_ecr_repository" "dataiku_container_exec" {
  name                 = "dataiku-dss-container-exec-base"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = var.common_tags
}

resource "aws_ecr_repository" "dataiku_apideployer" {
  name                 = "dataiku-dss-apideployer-base"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = var.common_tags
}

resource "aws_ecr_repository" "dataiku_spark_exec" {
  name                 = "dataiku-dss-spark-exec-base"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = var.common_tags
}


module "codebuild_api" {
  source = "./terraform/modules/codebuild-packer"
  # source                     = "osodevops/dataiku-dss/codebuild-packer#123456"
  additional_build_variables = { "NODE_TYPE" : "api" }
  encrypt_ami                = var.encrypt_ami
  kms_key_arn                = var.kms_key_arn
  instance_type              = var.packer_instance_type
  packer_file_location       = var.packer_file_location
  project_name               = var.project_name
  region                     = var.aws_region
  root_volume_size           = var.root_volume_size
  shared_ami_users           = var.shared_ami_users
  source_image_account_no    = var.source_image_account_no
  source_image_name          = var.source_image_name
  source_repository_url      = var.source_repository_url
  subnet_name_filter         = var.build_subnet_name_filter
  vpc_name                   = var.vpc_name
  github_api_token           = data.aws_ssm_parameter.github_pat.value # Uncomment to provide PAT from Parameter Store
  # github_api_token           = data.vault_generic_secret.github_pat  # Uncomment to provide PAT from Vault
}



module "codebuild_automation_designer" {
  source = "./terraform/modules/codebuild-packer"
  # source                     = "osodevops/dataiku-dss/codebuild-packer#123456"
  additional_build_variables = { "NODE_TYPE" : "design" }
  encrypt_ami                = var.encrypt_ami
  kms_key_arn                = var.kms_key_arn
  instance_type              = var.packer_instance_type
  packer_file_location       = var.packer_file_location
  project_name               = var.project_name
  region                     = var.aws_region
  root_volume_size           = var.root_volume_size
  shared_ami_users           = var.shared_ami_users
  source_image_account_no    = var.source_image_account_no
  source_image_name          = var.source_image_name
  source_repository_url      = var.source_repository_url
  subnet_name_filter         = var.build_subnet_name_filter
  vpc_name                   = var.vpc_name
  github_api_token           = data.aws_ssm_parameter.github_pat.value # Uncomment to provide PAT from Parameter Store
  # github_api_token           = data.vault_generic_secret.github_pat  # Uncomment to provide PAT from Vault
}


module "codebuild_automation_deployer" {
  source = "./terraform/modules/codebuild-packer"
  # source                     = "osodevops/dataiku-dss/codebuild-packer#123456"
  additional_build_variables = { "NODE_TYPE" : "deployer" }
  encrypt_ami                = var.encrypt_ami
  kms_key_arn                = var.kms_key_arn
  instance_type              = var.packer_instance_type
  packer_file_location       = var.packer_file_location
  project_name               = var.project_name
  region                     = var.aws_region
  root_volume_size           = var.root_volume_size
  shared_ami_users           = var.shared_ami_users
  source_image_account_no    = var.source_image_account_no
  source_image_name          = var.source_image_name
  source_repository_url      = var.source_repository_url
  subnet_name_filter         = var.build_subnet_name_filter
  vpc_name                   = var.vpc_name
  github_api_token           = data.aws_ssm_parameter.github_pat.value # Uncomment to provide PAT from Parameter Store
  # github_api_token           = data.vault_generic_secret.github_pat  # Uncomment to provide PAT from Vault
}


module "codebuild_automation_automation" {
  source = "./terraform/modules/codebuild-packer"
  # source                     = "osodevops/dataiku-dss/codebuild-packer#123456"
  additional_build_variables = { "NODE_TYPE" : "automation" }
  encrypt_ami                = var.encrypt_ami
  kms_key_arn                = var.kms_key_arn
  instance_type              = var.packer_instance_type
  packer_file_location       = var.packer_file_location
  project_name               = var.project_name
  region                     = var.aws_region
  root_volume_size           = var.root_volume_size
  shared_ami_users           = var.shared_ami_users
  source_image_account_no    = var.source_image_account_no
  source_image_name          = var.source_image_name
  source_repository_url      = var.source_repository_url
  subnet_name_filter         = var.build_subnet_name_filter
  vpc_name                   = var.vpc_name
  github_api_token           = data.aws_ssm_parameter.github_pat.value # Uncomment to provide PAT from Parameter Store
  # github_api_token           = data.vault_generic_secret.github_pat  # Uncomment to provide PAT from Vault
}
