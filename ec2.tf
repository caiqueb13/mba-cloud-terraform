# Referencia para o Networks
module "my-vpc" {
  source = "./modules/network"
}

# Captura da última AMI Ubuntu lançada

data "aws_ami" "ami_ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Criação do Security Group

module "docker_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "docker-instance-sg"
  description = "Security Group para a Instancia com Docker"
  vpc_id      = module.my-vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  egress_rules        = ["all-all"]
}


# Modelo de instância e configurações

module "docker_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "docker-projeto"

  ami                    = data.aws_ami.ami_ubuntu.id
  instance_type          = "t3a.micro"
  key_name               = "chave-new-gen"
  monitoring             = true
  vpc_security_group_ids = [module.docker_sg.security_group_id]
  subnet_id              = module.my-vpc.subnet-name1
  iam_instance_profile   = "LabInstanceProfile"
  user_data              = file("./docker.sh")

  tags = {
    Terraform = "true"
    Docker    = "true"
  }
}

resource "aws_eip" "ip-publico" {
  instance = module.docker_ec2_instance.id
  vpc      = true
}