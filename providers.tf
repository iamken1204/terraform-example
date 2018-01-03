provider "aws" {
  alias = "qa_tokyo"

  region                  = "ap-northeast-1"
  shared_credentials_file = "/Users/kettan/.aws/credentials"
  profile                 = "astraqa"
}

provider "aws" {
  alias = "prod_tokyo"

  region                  = "ap-northeast-1"
  shared_credentials_file = "/Users/kettan/.aws/credentials"
  profile                 = "astraprod"
}

provider "aws" {
  alias = "prod_singapore"

  region                  = "ap-southeast-1"
  shared_credentials_file = "/Users/kettan/.aws/credentials"
  profile                 = "astraprod"
}
