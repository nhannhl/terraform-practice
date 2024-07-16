# Quản lý Terraform State sử dụng S3 bucket

- Thêm trước S3, DynamoDB với PartitionKey là LockID (String)
- Vì này dùng S3 để quản lý state nên source sẽ không generate file .tfstate