# PROBLEM
Using an automation tool of your choice (eg. Ansible, Puppet, Chef, Terraform or a suitable combination thereof), produce the
necessary manifests to deploy a basic web application into any cloud provider.
The service should be logically separated into 3 distinct areas
1. A load balancer.
2. The software logic responsible for serving responding to HTTP requests.
3. A persistence backend.

# Solution

* Terraform code has been resided into 'terraform' folder
* The solution has been deployed into AWS Cloud
* Custom AMI has been used with preinstalled libraries/tools
* The terraform code will deploy the following resources:
    - Load Balancer
    - EC2 instace pools
    - RDS database 
    - VPC
    - Private Subnets
    - Rout Tables
    
* Application needs to be accessed via the Load Balancer's DNS not. Direct access to the EC2 instance will not be possible. 
