## Deploy the sample microserves app and explore observability

### Build the sample application with Terraform

```bash
cd ~/environment/ecs-squid/ecsworkshop/mesh-microservice-app/
```

```bash
terraform init
terraform plan -out tfplan
```

```bash
terraform apply tfplan
```

### Explore the observabilty of the deployed application:

Using Container Insights

Using X-Ray



