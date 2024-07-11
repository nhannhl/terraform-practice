# Tạo 1 template Terraform đơn giản với 1 EC2 instance, 1 Security Group

# Step 
## Step1: Tạo một key pair cho SSH với EC2
```ssh-keygen -t rsa -b 4096 -C "your e-mail"```

## Step2: Tạo file main.tf để config template
## Step3: init - plan - apply - destroy
```
terraform init
terraform plan
terraform apply
terraform destroy
```