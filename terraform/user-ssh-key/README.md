## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_user_ssh_key.public_ssh_key](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/user_ssh_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | "Github token required for provider authentication.<br>    If not set, GITHUB\_TOKEN environment variable <br>    can also be provided to avoid commiting secret." | `any` | n/a | yes |
| <a name="input_public_ssh_key_file_path"></a> [public\_ssh\_key\_file\_path](#input\_public\_ssh\_key\_file\_path) | Path to the file containg public SSH key. | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_public_ssh_key_name"></a> [public\_ssh\_key\_name](#input\_public\_ssh\_key\_name) | Name of the SSH key file used for authentication. | `string` | `"Github SSH public key"` | no |
| <a name="input_ssh_auth_enabled"></a> [ssh\_auth\_enabled](#input\_ssh\_auth\_enabled) | "If set to true, creates SSH authentication key<br>    in given Github account." | `bool` | n/a | yes |

## Outputs

No outputs.
