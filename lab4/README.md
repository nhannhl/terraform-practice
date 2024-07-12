# Tiếp tục lab3, sử dụng module, kết hợp output

## Các file trong lab4
- version.tf: file định nghĩa version cho từng provider
- providers.tf: file định nghĩa provider
- main.tf: file định nghĩa resource
- output.tf: file định nghĩa output
- variables.tf: file định nghĩa variable
- terraform.tfvars: file định nghĩa tfvars đầu vào cho variables.tf
- modules: folder định nghĩa module, mỗi module tương ứng cũng có main.tf, variable.tf, output.tf

## Source này có sử dụng thêm provider http để lấy current ip setting cho Security Group trong SSH với EC2
