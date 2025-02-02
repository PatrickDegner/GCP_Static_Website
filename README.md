# GCP Static Website Deployment with Terraform

This project deploys a static website to Google Cloud Platform (GCP) using Terraform. It includes an `index.html` main page, a `404.html` error page, and an image. The infrastructure is defined using Terraform, allowing for easy and repeatable deployments. 

## Prerequisites

Before you begin, ensure you have the following:

1. **GCP Project:** You'll need an active GCP project. If you don't have one, create it in the GCP Console: [https://console.cloud.google.com/](https://console.cloud.google.com/). Note down your Project ID.

2. **GCP Service Account:** Terraform needs a service account to interact with your GCP project. Create a service account with the "Storage Admin" role. Download the service account's JSON key file. See the Google Cloud documentation for how to create a service account and grant it the required permissions: [https://cloud.google.com/iam/docs/creating-managing-service-accounts](https://cloud.google.com/iam/docs/creating-managing-service-accounts)

3. **Terraform:** Install Terraform on your local machine. You can download it from the official Terraform website: [https://www.terraform.io/downloads](https://www.terraform.io/downloads)

## Project Structure

```
GCP_Static_Website/
├── website/
│   ├── 404.html
│   ├── index.html
│   └── me.png  
├── terraform/
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf
│   └── variables.tf
├── .gitignore
└── README.md
```

* **website/:** Contains the static website files.
* **terraform/:** Contains the Terraform configuration files.
* **.gitignore:** Specifies files that Git should ignore.
* **README.md:** This file (the one you're reading).

## Setup and Deployment (Without Remote State)

1. **Clone the Repository (if applicable):** If this project is in a Git repository, clone it to your local machine.

2. **Navigate to the Terraform Directory:**

   ```bash
   cd GCP_Static_Website/terraform
   ```

3. **Configure Variables:** Create a file named `terraform.tfvars` in the `terraform` directory. Add the following variables, replacing the placeholders with your actual values:

   ```terraform
   project = "your-gcp-project-id" # Your GCP project ID
   region  = "EU" # Your preferred GCP region
   ```
   * **Important:** Keep the `terraform.tfvars` file secure and do not commit it to version control.

4. **Initialize Terraform:**

   ```bash
   terraform init
   ```
   This command initializes the Terraform working directory and downloads the necessary providers. *Because you are not configuring a backend, the state will be stored locally.*

5. **Plan the Deployment:**

   ```bash
   terraform plan
   ```
   This command shows you what changes Terraform will make to your infrastructure. Review the output carefully before proceeding.

6. **Apply the Deployment:**

   ```bash
   terraform apply
   ```
   This command creates the resources defined in your Terraform configuration. You'll be prompted to confirm the changes. Type `yes` and press Enter to proceed.

7. **Get the Website URL:** After the deployment completes, Terraform will output the URL of your website. You can also see it in the output of the `terraform apply` command or by running:

   ```bash
   terraform output website_url
   ```

8. **Access your Website:** Open the URL in your web browser to view your deployed static website.

## Destroying the Infrastructure

When you're finished with the project and want to remove the deployed resources, run the following command:

```bash
terraform destroy
```