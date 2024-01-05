# Création de l'instance EC2
resource "aws_instance" "main" {
  ami             = var.ami
  instance_type   = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id       = aws_subnet.my_subnet.id

  tags = {
    Name = "MonInstanceToto"
  }
}

# Création du VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
 
  tags = {
    Name = "VPC_TP_Judi"
  }
}

# Subnet utilisé pour le VPC
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.aws_region_availibility
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet_Toto"
  }
}

# Groupe de sécurité
resource "aws_security_group" "allow_tls" {
  name        = var.security_group_name            # Nom du groupe
  description = "Allow TLS inbound traffic"        # Description de la règle
  vpc_id      = aws_vpc.main.id
 
    # Autorisation du trafic entrant
  ingress {
    description      = "TLS from VPC"
    from_port        = 443                         # Numéro de port d'entrer autorisé
    to_port          = 443                         # Numéro de port à destination autorisé
    protocol         = "tcp"                       # Protocole autorisé
    cidr_blocks      = [aws_vpc.main.cidr_block]   # Réseau autorisé
  }

    # Autorisation du trafic sortant
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}