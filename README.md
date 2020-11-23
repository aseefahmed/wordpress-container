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
* Secrets like database password are stored into AWS Secret Manager instead of directly injecting into the code
* The terraform code will deploy the following resources:
    - Load Balancer
    - EC2 instace pools
    - RDS database 
    - VPC
    - Private Subnets
    - Rout Tables
    
* Application needs to be accessed via the Load Balancer's DNS name. Direct access to the EC2 instance will not be possible. 
* Wordpress application is dockerized based on the source code

# Proposed Improvements

Because of time constraint, it was not possible to fully implement the architecture. However, its worth noting the improvements that can be brought to this architecutre.

* statics files such as images/javascript/css/videos can be stored into S3 bucket instead of directly stored in the EC2 machine
* Autoscaling group can be implemented to scale in/out number of EC2 instances based on demands
* Rout53 can be integrated with load balancer
* Cloudfront can be integrated with S3 bucket to imporove latency. 
* At this stage, the application is a monolothic application. It can be furhter broken into microservices and deployed into kubernetes cluster to make the application highly available and fault tolerant. 
