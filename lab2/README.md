# Tiếp tục với lab1, sử dụng Parameter, Mapping và Variable trong Terraform
# Sử dụng lại resource lab1

# Variables
- Có thể định nghĩa variable trực tiếp trong file main.tf
- File variable.tf dùng để định nghĩa variable trong file main.tf, nếu không dùng định nghĩa trưc tiếp trong file main.tf
- Để apply giá trị variable khi plan hoặc apply thì như sau:
-- Dùng trực tiếp trong console khi run terraform apply
-- Dùng kiểu var khi run terraform apply -var "instance_type=t3.micro"
-- Hoặc định nghĩa file terraform.tfvars như source, gọi với terraform apply -var-file="name_file.tfvars", mặc định là terraform.tfvars
-- *Khi chạy apply với -var-file thì khi destroy cũng phải chạy với -var-file để tìm đúng variable*