# Terraform
Terraform is an infrastructure as code software tool that allows you to define resources in human-readable configuration files that you can version, reuse, and share on cloud and on-prem.
Below are some Terraform projects that have I've configured, along with screenshots of results.
These projects create & deploy AWS infrastructures using HCL scripts.

<hr/>
3 essesntial files required for a Terraform project are:
<b><i>main.tf:</i></b> Main configuration file of the infrastructure, where the resource declarations are written. <br/>
<b><i>variables.tf:</i></b> Variables are DECLARED in this file that will be used in main.tf which allows the infrastructure to be flexible & reusable. <br/>
<b><i>terraform.tfvars.tf:</i></b> Variables values are SET for variables defined in variables.tf file. It allows you to customize your infrastructure without modifying the main configuration files. <br/>
<hr/>

<h3><b><i>Prerequisistes:</i></b></h3>

1. AWSCLI must be installed on your local or server machine. Make sure your IAM Role has all the required permissions for the services that you'll be using.
<img width="642" alt="awsconfigure" src="https://github.com/NavreetK/Terraform/assets/46690891/8dbe27bd-2920-4e5b-be29-201ee747b1b5">

<img width="959" alt="IAMuser" src="https://github.com/NavreetK/Terraform/assets/46690891/a096bba8-135e-4923-8711-b83c34b43924">

<img width="942" alt="userpermissions" src="https://github.com/NavreetK/Terraform/assets/46690891/be38e2cd-35fc-4efc-b342-8a39b0e47445">



2. Install Terraform on a local or server machine
<hr/>

Essential Terraform commands are:
<b>Terraform init:</b> the first command you run when starting a new Terraform project or when adding new providers to an existing project.<br/>
<b>Terraform plan:</b> it shows what changes Terraform will make when terraform apply is run, without actually making any changes to the infrastructure.<br/>
<b>Terraform apply:</b> used to apply the changes defined in your configuration files to the actual infrastructure.<br/>
<b>Terraform destroy:</b> reads the configuration & destroys all the resources.<br/>

Terraform blocks:
Mainly I have used the "resource" and "data" blocks in my projects. The 'resource' block is used to create resources, whereas the 'data' block will use the existing resources.

<hr/>

Now we have everything installed with the required permissions. Let's get started with our projects.

1. [ECS](https://github.com/NavreetK/Terraform/blob/main/Terraform/ECS/README.md) - This project is creating an ec2 instance along with Auto Scaling Group (ASG), Load Balancer (LB), Database (RDS), and deployed that to a domain using ROUTE53.

2. [Lightsail](https://github.com/NavreetK/Terraform/blob/main/Terraform/lightsail/README.md) - This project sets up an AWS Lightsail instance with specified configurations and outputs the public IP address of the created instance. 

3. [Fargate](https://github.com/NavreetK/Terraform/blob/main/Terraform/fargate/README.md) - This project is used to set up an ECS Fargate service within a specified VPC and subnet, along with necessary security group configurations.

4. [Beanstalk](https://github.com/NavreetK/Terraform/blob/main/Terraform/beanstalk/README.md) - This project sets up an Elastic Beanstalk application and environment in AWS, allowing you to deploy and manage your applications easily.









