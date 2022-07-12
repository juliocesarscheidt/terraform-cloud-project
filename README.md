# Terraform Cloud

[https://www.terraform.io/language/settings/backends/remote](https://www.terraform.io/language/settings/backends/remote)

[https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http)

[https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs)

[https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_instance_v2](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_instance_v2)

```bash

terraform login
# token:

cat $HOME/.terraform.d/credentials.tfrc.json

# or put credentials here:
cat > $HOME/.terraform.d/credentials.tfrc.json <<EOF
{
  "credentials": {
    "app.terraform.io": {
      "token": ""
    }
  }
}
EOF

# running terraform
terraform init -backend-config=config.remote.tfbackend

# validate and format
terraform validate
terraform fmt -write=true -recursive

# plan
terraform plan
terraform plan -out=tfplan

# apply
terraform apply -input=false -auto-approve
terraform apply -input=false tfplan

# replace a resource
terraform apply -replace openstack_compute_instance_v2.local_instance -input=false -auto-approve

# output
terraform output -json | jq -r '.body.value'
terraform output last

# migrate-state
terraform init -reconfigure

# planning the destroy
terraform plan -destroy

# destroying
terraform apply -destroy
# or
terraform destroy
# destroy only a resource
terraform destroy -target openstack_compute_instance_v2.local_instance -auto-approve

```
