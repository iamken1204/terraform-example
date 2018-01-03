module "qa_tokyo" {
  providers = {
    aws = "aws.qa_tokyo"
  }

  source = "./modules/qa/ap-northeast-1"

  cvgo_sqs_name = "${var.cvgo_sqs_name}"
}

module "prod_tokyo" {
  providers = {
    aws = "aws.prod_tokyo"
  }

  source = "./modules/prod/ap-northeast-1"
}

module "prod_tokyo_cvgo" {
  providers = {
    aws = "aws.prod_tokyo"
  }

  source = "./modules/cvgo"

  cvgo_ami_ID                  = "${module.prod_tokyo.cvgo_ami_ID}"
  cvgo_ami_ID_asg              = "${module.prod_tokyo.cvgo_ami_ID_asg}"
  sgSSH_ID                     = "${module.prod_tokyo.sgSSH_ID}"
  sgCV_ID                      = "${module.prod_tokyo.sgCV_ID}"
  sgRDS_ID                     = "${module.prod_tokyo.sgRDS_ID}"
  subnet_goServiceA_ID         = "${module.prod_tokyo.subnet_goServiceA_ID}"
  subnet_goServiceC_ID         = "${module.prod_tokyo.subnet_goServiceC_ID}"
  cvgo_sqs_name                = "${var.cvgo_sqs_name}"
  db_subnet_group_default_NAME = "${module.prod_tokyo.db_subnet_group_default_NAME}"
}

module "prod_singapore_general" {
  providers = {
    aws = "aws.prod_singapore"
  }

  source = "./modules/prod/ap-southeast-1"
}
