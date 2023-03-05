# Github IoC Terraform module

Set of Terraform modules and resources facilitating management of personal Github repositories and Github SSH keys with Terraform as Infrastructure as Code.

## Prerequisits

### Terraform

Terraform can be installed by following instrruction provided
here: `https://developer.hashicorp.com/terraform/downloads`

### Github provider authentication

Setting GITHUB_TOKEN environment variable is the recommended way of Github provider authentication. This allows to expose secret only locally, and mitigates the risk of commiting it to repository.

Alternatively, `github_token` variable can be provided during module instantiation

## Github SSH key management

Github allows to configure secure SSH authentication.

To cut long story short, users can generate SSH key pair (private and public) and then configure public key as authentication method in Github account's settings. At this point any SSH agent with configured private key can communicate with this accounts repositories.

>> Is is very important to keep private SSH key private as it serves as authenticator.

To configure and manage keys with Terraform:

* Set `ssh_auth_enabled` variable to `true`:
```
ssh_auth_enabled = true
```

* Run:

```
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa -C "" <<<y >/dev/null 2>&1
```

>> This will generate `id_rsa` private key and `id_rsa.pub` public key inside `~/.ssh/` directory. By default terraform will look for public key in the following location: `~/.ssh/id_rsa.pub`. This is exactly where the bublic key has been created. Default SSH public key path location can be changed by providing new value in `public_ssh_key_file_path` variable. This will also require to make changes to above command or moving/renaming key manually.

* Start SSH agent:

```
eval "$(ssh-agent -s)"
```

* Add SSH key to the local agent:

```
ssh-add ~/.ssh/id_rsa
```

>> Depending on operating system some additonal steps may be required. More information can be found here: `https://docs.github.com/en/authentication/connecting-to-github-with-ssh`.

* Apply Terraform module to create public key in Github:

```
terraform apply
```

>> At this point to rotate the key you can run `ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa -C "" <<<y >/dev/null 2>&1` to create new key pair which will overwrite the existing one and run `terraform apply` to update public key in your Github account.

## Terraform state file management

Terraform state file stores state of resources managed by Terraform. Backend has been configured to use file placed in the terraform module directory:
`"./terraform.tfstate"`. File location can be changed by setting `terraform_state_file_path` variable.

>> State file should not contain any secrets or sensitive values. It can contain public key if `ssh_auth_enabled` variable is set to true. This does not pose security issue and `terraform.tfstate` can still be commited and managed in private repository.

## How to use

```hcl
module "repos" {
  source = "git@github.com:lukeozga/github-ioc.git//terraform?ref=master"

  ssh_auth_enabled = true
  standard_github_repositories = [
     {
      name = "example_repo"
      description = "example_value"
      gitignore_template = null
      homepage_url = null
      license_template = null
      topics = ["example_topic_1", "example_topic_2"]
      visibility = "private"
      pages = null
    },
    {
      name = "example_repo_1"
      description = "example_value_1"
      gitignore_template = null
      homepage_url = null
      license_template = null
      topics = []
      visibility = "public"
      pages = null
    },
  ]
}
```

>> Due to default branch being created and assigned after repository creation, `pages` key's value must be set to `null` at first. After default branch has been created additional specification can be provided and applied.

## Other information

Terraform docs have been generated with: `https://github.com/terraform-docs/terraform-docs`