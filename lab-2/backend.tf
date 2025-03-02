terraform {
  backend "s3" {
    bucket         = "bishoy-bucket"  
    key            = "lab-2/terraform.tfstate"      
    region         = "us-east-2"                    
    dynamodb_table = "terraform-lock-table"         
    encrypt        = true                           
}
}