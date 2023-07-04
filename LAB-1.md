## Deploy the squid proxy on ECS

### Run the setup script

```bash
squid/00-setup.sh
```

### Examine the Terraform files

```bash
cd tf-squid
```

### Deploy the squid application

```bash
terraform init
terraform validate
terraform plan -out tfplan
terraform apply tfplan
```

### Usw the AWS console to verify / explore the deployment

* Find the ECS Cluster



