# URL Status Checker Lambda Function

## Introduction
This project features a simple Python lambda function that checks the status of HTTP/HTTPS endpoints. It's designed to return a status message indicating whether an endpoint is live. The lambda function is deployed on AWS, using Terraform for infrastructure management.

## Features
- Checks the live status of HTTP and HTTPS endpoints.
- Returns a clear status message based on the endpoint's response.
- Deployed using AWS Lambda for robust, scalable performance.
- Infrastructure as Code (IaC) approach with Terraform.

## Requirements
- Python 3.x
- AWS account with appropriate permissions
- Terraform

## Installation and Setup
1. Clone the repository: `git clone https://github.com/oluseyiayankogbe/url-status-checker-lambda-function-saas-startup.git`.
2. Configure your AWS credentials.
3. Initialize Terraform: `terraform init`.
4. Apply Terraform configurations: `terraform apply`.

## Usage
After deployment, invoke the lambda function with the URL of the endpoint you wish to check. The function will return a status message regarding the endpoint's availability.

## AWS and Terraform Configuration
This project leverages AWS Lambda for running the Python function. Terraform scripts are included for easy deployment and management of the AWS resources.

## Troubleshooting and Support
For troubleshooting, check the AWS Lambda logs for execution details. For additional support or queries, please open an issue in the GitHub repository.

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your improvements.



---

Feel free to customize this template to better suit your project's specifics and requirements.
