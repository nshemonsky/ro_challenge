## Overview

This repo provides Terraform code and a cookbook for deploying a basic
web app to EC2 that will be publicly available and display a Hello World type
message.

You will need the private ssh key to provision the instance
and your own access keys with permissions to the AWS account.

The TF code creates the VPC and security group for the instance, as
well as provides the ability to deploy the web server. TF provides a chef
provisioner but it does not support chef-zero natively.  Worked around this via
the code in the remote-exec provisioner.

Cookbook specific documentation can be found in the `flask_app`
cookbook [README.md](cookbooks/flask_app/README.md).

## Basic Usage

After cloning the repo `cd` into the terraform directory and run:
`terraform init`

To validate things will blend:
`terraform plan -var key_path=/path/to/ro-challenge.pem -var access_key=$ACCESS_KEY -var secret_key=$SECRET_KEY`

To deploy the web server:
`terraform apply -var key_path=/path/to/ro-challenge.pem -var access_key=$ACCESS_KEY -var secret_key=$SECRET_KEY`

Example Output:

```
Outputs:

web_server_ip = [
    52.214.167.218
]

13:45 $ curl 52.214.167.218
Hello ReactiveOps!
```

To clean up the instance:
`terraform destroy -var key_path=/path/to/ro-challenge.pem -var access_key=$ACCESS_KEY -var secret_key=$SECRET_KEY -target aws_instance.web_server`
