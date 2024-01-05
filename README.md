# Deploiement dans AWS avec Terraform
La configuration Terraform dans ce repository permet de deployer une instance EC2, un VPC, un security group et un backend S3 sur un provide AWS.
## Prerequis
Des prérequis sont nécessaire avant d'effectuer une création d'instance :
- Installation de Terraform : https://devopssec.fr/article/installer-configurer-environnement-terraform
- Récuperation des clés d'authentification AWS
- Windows 10 ou +

## Configuration
1. Téléchargez les fichiers du depot GitHub :
    - provider.tf
    - main.tf
    - variables.tf
    - terraform.tfvars

2. Modification des variables dans le fichier 'terraform.tfvars' :

```hcl
aws_access_key = "votre_clé_d'accès_aws"
aws_secret_key = "votre_clé_secrète_aws"
```

3. Initialisation et planification de la configuration :

```bash
terraform init -var-file="terraform.tfvars"
terraform plan -var-file="terraform.tfvars"
```

4. Application de la configuration :
   
```bash
terraform apply -var-file="terraform.tfvars"


```

5. Supression du projet sur AWS :

```bash
terraform destroy -var-file="terraform.tfvars"


```
