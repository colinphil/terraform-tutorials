# Terraform Provider Tutorials

## References
This is a collection of the Terraform tutorials provided by HashiCorp for the three main cloud service providers: [__AWS__](https://aws.amazon.com/), [__Azure__](https://azure.microsoft.com/en-us/), and [__GCP__](https://cloud.google.com/) (along with a simple Docker container example). This [__link__](https://learn.hashicorp.com/terraform) goes to the associated documentation - please reference the "Get Started" section to access the tutorials. Please refer to the tutorials to learn more about setting variables, outputs, and hooking up a remote backend for state management via Terraform Cloud. 

## Terraform Overview

Terraform is an __infrastructure as code (IaC)__ tool that uses a standardized workflow for provisioning resources across a variety of third-party platforms. The workflow is defined below:

- Infrastructure is defined in Terraform configuration (~.tf) files that uses a declarative configuration language
- Project is initialized with relevant resources and plugins (providers) downloaded 
- Before deploying changes, an execution plan is made that describes all resources that will be created/modified/deleted 
- A resource graph is created and creates/modifies/deletes non-dependent resources in parallel when the execution plan is executed

In order to create an execution plan, Terraform is dependent on the __project's state__ - this is the actual infrastructure that currently exists. When creating an execution plan, the Terraform core engine essentially creates a diff between the existing infrastructure (if it exists) and the newly declared resources. By default, this project state is stored locally in the project directory - Terraform Cloud allows for using a remote state instead to ensure consistency for collaboration. Please refer to the HashiCorp tutorials to learn more. 

## Key Terms
- __Provider__: Plugins that allow Terraform with cloud platforms and other services via APIs. These are listed in the [Terraform Registry](https://registry.terraform.io/) - in each project, one needs a provider to actual perform an action. E.g., to deploy AWS resources, one must use the [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs).
- __Terraform Configuration__: set of files used to describe the infrastructure in Terraform Language. 

## Configuration Components
The infrastructure configuration is defined in Terraform files that all end in `.tf`. The infra is then defined in the [Terraform Language](https://www.terraform.io/docs/language/index.html). Some key components are defined within the configuration - each represented as blocks analogous to JSON:

- `terraform {}`: Contains the Terraform settings, including the required providers to provision infrastructure
- `provider "{provider_name}" {}`: Configures a specified provider - multiple provider blocks can be included in a configuration
- `resource "{resource_type}" "{resource_name}" {}`: Defines the individual components of the infrastructure, declaring a unique resource_type and resource_name combination that can be used to reference the resource within the configuration. 

## File Descriptions
In each project, there will be certain files that are relevant. A description is provided of each:

- `{name}.tf`: A Terraform configuration file - this defines the desired intrastructure.
- `.terraform`: Directory that contains downloaded providers' files
- `.terraform.lock.hcl`: This file records the provider versions to ensure consistency in project creation and sharing
- `terraform.tfstate`: This file contain's the local project's state - this is used for tracking the generated resources and creation of execution plans
- `terraform.tfstate.lock.info`: A temporary file created during applying/deleting a configuration. 
- `terraform.tfvars`: Essentially an env file - loads contained variables when running Terraform operations. Can place private information and omit with .gitignore. 

It should be noted that all files that end in `.tf` are automatically loaded when running `terraform plan/apply`. 

## Project Creation Steps
This assumes that the appropriate credentials and Terraform CLI have been downloaded locally. The following steps are used for creating a basic project:

1. Define a Terraform configuration in a (or many) `.tf` file
2. `terraform init` to download providers and setup state
3. `terraform validate` to check for syntax and/or logical errors
4. `terraform apply` to view the execution plan and approve it in order to deploy infrastrucutre
5. `terraform destroy` to delete the infrastructure components at end of lifecycle

Other useful commands:

- `terraform show`: Display the current state
- `terraform state list`: Lists all the resources in the project's state
- `terraform graph`: Visualize the execute plan to show dependencies

