# Github IoC Terraform module

Set of Terraform modules and resources allowing management of personal Github repositories with Terraform as Infrastructure as Code

## Prerequisits

### Terraform

Terraform can be installed by following instrruction provided
here: `https://developer.hashicorp.com/terraform/downloads`

### Github provider authentication

Setting GITHUB_TOKEN environment variable is the recommended way of Github provider authentication. This allows to expose secret only locally, and mitigates the risk of commiting it to repository.

Alternatively, `github_token` variable can be provided during module instantiation

## Terraform state file management

Terraform state file stores state of resources managed by Terraform. Backend has been configured to use file placed in the terraform directory:
`"./terraform.tfstate"`. File location can be changed by setting `terraform_state_file_path` variable.