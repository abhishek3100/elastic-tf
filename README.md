
# ElasticSearch & Kibana Initiation using Terraform

This directory contains terraform script that can be used to create Elasticearch
 & Kibana alongside in an GCP instance [vm]. 
 

## Specifications
By default [for modification do change tfvars files]
- Ubuntu 20.04
- 10GB Boot Disk
- n1-standard-2 [2vCPU & 7.5GB Memory]


## Setting Up Environment

Install terraform 

```html
https://learn.hashicorp.com/tutorials/terraform/install-cli
```

- Gcloud should be configured
```bash
gcloud auth login
``` 
- Or Use Service Account [ using Key file 😟 or Using Impersonation ✅ ]
```bash
export GOOGLE_APPLICATION_CREDENTIALS=PATH_TO_JSON

gcloud config set auth/impersonate_service_account SA_EMAIL
```

## Deployment


To initialize directory 
```bash
terraform init
```

To do a plan

```bash
terraform plan -out plan.out
```

To apply 
```bash
terraform apply plan.out
```

To destroy
```bash
terraform destroy
```

To deploy with tfvars
```bash
env=dev
terraform plan -var-file $env.tfvars -out plan.out
terraform apply -var-file $env.tfvars -out plan.out
```
## Appendix

I've modified kibana.yml configuration to be accessible remotely. You can browse Kibana dashboard on http://ip-address:5601 

Give VM to be fully available [start of elastic/kibana] for about 3-4 minutes.

