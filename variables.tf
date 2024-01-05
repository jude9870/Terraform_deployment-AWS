# Variable pour définir la région d'application de l'instance
variable "aws_region" {
  description = "Region AWS"
  type        = string
  default     = "eu-west-3"             # Remplacez par la région de votre choix
}

# Variable nécessaire pour le subnet
variable "aws_region_availibility" {
  description = "Region AWS availibity"
  type        = string
  default     = "eu-west-3a"            # Remplacez par la région de votre choix
}

# Clé d'accès AWS
variable "aws_access_key" {
  description = "Clé d'accès AWS"
  type        = string
}

# Clé de secret AWS
variable "aws_secret_key" {
  description = "Clé d'accès AWS"
  type        = string
}

# Type d'instance
variable "instance_type" {
  description = "Type d'instance EC2"
  default     = "t2.micro"              # Remplacez par le type d'instance à créer
}

# Définition du type d'image à utiliser
variable "ami" {
  description = "AMI ID Amazon Linux 2023"
  default     = "ami-02ea01341a2884771" # Modifier par le numéro d'AMI souhaitée
}

# Sous-réseaux à créer pour le VPC
variable "vpc_cidr_block" {
  description = "CIDR block pour le sous-réseau du VPC"
  default     = "10.0.0.0/16"
}

# Sous-réseaux
variable "subnet_cidr_block" {
  description = "CIDR block pour le sous-réseau"
  default     = "10.0.1.0/24"
}

# Nom du groupe de sécurité
variable "security_group_name" {
  description = "Nom du groupe de sécurité"
  default     = "secugroup_judi"        # Modifier selon votre convenance
}