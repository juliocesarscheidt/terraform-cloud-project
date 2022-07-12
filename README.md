

```bash

terraform login
# token:

$HOME/.terraform.d/credentials.tfrc.json

cat > $HOME/.terraform.d/credentials.tfrc.json <<EOF
{
  "credentials": {
    "app.terraform.io": {
      "token": ""
    }
  }
}
EOF

# export TF_CLOUD_ORGANIZATION="blackdevs"
# export TF_CLOUD_HOSTNAME="app.terraform.io"
# export TF_WORKSPACE="development"

terraform init -backend-config=config.remote.tfbackend

terraform plan
terraform plan -out=tfplan

terraform apply -input=false -auto-approve
terraform apply -input=false tfplan

terraform output

terraform output last


# migrate-state
terraform init -reconfigure

```
