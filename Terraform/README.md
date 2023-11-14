# Terraform
Terraform is an infrastructure as code software tool that allows you to define resources in human-readable configuration files that you can version, reuse, and share on cloud and on-prem.
Below are some Terraform projects that have I've configured, along with screenshots of results.
These projects create & deploy AWS infrastructures using HCL scripts.

<hr/>
3 essesntial files required for a Terraform project are:
<b><i>main.tf:</i></b> Main configuration file of the infrastructure, where the resource declarations are written.
<b><i>variables.tf:</i></b> Variables are DECLARED in this file that will be used in main.tf which allows the infrastructure to be flexible & reusable.
<b><i>terraform.tfvars.tf:</i></b> Variables values are SET for variables defined in variables.tf file. It allows you to customize your infrastructure without modifying the main configuration files.
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
<b>Terraform plan:</b> it shows what changes Terraform will make when terraform apply is run, without actually making any changes to the infrastructure.
<b>Terraform apply:</b> used to apply the changes defined in your configuration files to the actual infrastructure.
<b>Terraform destroy:</b> reads the configuration & destroys all the resources.<br/>

Terraform blocks:
Mainly I have used the "resource" and "data" blocks in my projects. The 'resource' block is used to create resources, whereas the 'data' block will use the existing resources.

<hr/>

Now we have everything installed with the required permissions. Let's get started with our projects.

1. terraform_AWS - In this project, I have created an ec2 instance along with Auto Scaling Group (ASG), Load Balancer (LB), Database (RDS), and deployed that to a domain using ROUTE53.

*Instance created  
<img width="960" alt="instances" src="https://github.com/NavreetK/Terraform/assets/46690891/7e9bf750-f9ba-48d3-a077-8b74ccaf20e3">

*Auto Scaling Group
<img width="960" alt="ASG" src="https://github.com/NavreetK/Terraform/assets/46690891/c1c46608-42a9-41b5-bdf3-768bd816ee7f">

*Database - RDS 
<img width="960" alt="rds" src="https://github.com/NavreetK/Terraform/assets/46690891/a1507256-8d15-4b8a-bd8f-94ac3655258d">

*Load Balancer and Target Group 
<img width="950" alt="targetgroup" src="https://github.com/NavreetK/Terraform/assets/46690891/eb86eee6-5713-47d1-9499-9dfbd637cee3">

<img width="960" alt="LB" src="https://github.com/NavreetK/Terraform/assets/46690891/2709009a-a8ad-4b92-b008-6289a971fee0">

*Hosted Zones for registered Domain
<img width="947" alt="hostedzone" src="https://github.com/NavreetK/Terraform/assets/46690891/2aad3a09-d922-4392-8fc7-c70393675be9">

End Result - Route53 domain
<img width="748" alt="route53" src="https://github.com/NavreetK/Terraform/assets/46690891/3d98997d-bac1-4b39-b0d4-c3c194dab6b3">





