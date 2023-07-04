## Deploy the squid proxy on ECS


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

### Use the AWS console to verify / explore the deployment

Using the console find and explore these resources

* The ECS Cluster
* ECS service
* ECS tasks
* Task definitions
* Load Balancers

Note which task definition is deployed and which container image 



### Setup a custom squid image

```bash
squid/setup-custom-squid.sh
```

Track the build in code pipeline / build

Observe the ECR repo

### Adjust Terraform to deploy our squid container











