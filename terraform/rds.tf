provider "aws" {
  region  = var.aws_region
}

resource "aws_db_instance" "progres-test" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "11.6"
  instance_class         = "db.t2.micro"
  name                   = "mydb"
  username               = "postgre"
  password               = "admin12345"
  parameter_group_name   = "default.postgres11"
  publicly_accessible    = true
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.postgres_sg.id]
}

resource "aws_security_group" "postgres_sg" {
  name = "postgres-test"

  description = "RDS postgres servers (terraform-managed)"
  vpc_id = var.rds_vpc_id

  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "rds_endpoint" {
  value = join("${aws_db_instance.progres-test.endpoint}",["jdbc:postgresql://","/postgres"])
}

