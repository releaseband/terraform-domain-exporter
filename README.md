<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.3.6 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.8.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.16.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.8.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.16.1 |

## Resources

| Name | Type |
|------|------|
| [helm_release.domain-exporter](https://registry.terraform.io/providers/hashicorp/helm/2.8.0/docs/resources/release) | resource |
| [kubernetes_network_policy.domain-exporter](https://registry.terraform.io/providers/hashicorp/kubernetes/2.16.1/docs/resources/network_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_list"></a> [domain\_list](#input\_domain\_list) | list of domains to monitoring ny domain exporter | `string` | `"google.com"` | no |
| <a name="input_image_repository"></a> [image\_repository](#input\_image\_repository) | domain exporter image repository | `string` | `"caarlos0/domain_exporter"` | no |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | domain exporter image tag | `string` | `"v1.17.1"` | no |
<!-- END_TF_DOCS -->