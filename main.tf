provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformExample"
  }
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "your-unique-bucket-name"
  acl    = "private"
}

resource "aws_db_instance" "db" {
  allocated_storage    = 10
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "bar"
  parameter_group_name = "default.mysql5.6"
}
