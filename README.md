# CPTC 2023 Globals Network builder
Thank you to RIT and the CPTC team for making the globals images available so we can do this.

## Requirements
1. Terraform on host machine
2. Functioning OpenStack cluster
3. Openstack Application Credential to auth to the cluster

### Openstack Project Quota requirements
- At least 18 instances
- At least 27 vcpus
- At least 45 GB of ram
- At least 18 volumes
- If running Ceph with raw disks, 950GB of space
- 20 Security Groups
- 116 Security Group rules
- 1 Network
- At least 23 ports

## How to use this repo

Git clone the repo
```
https://github.com/gr4ytech/cptc2023-network-openstack.git
```

Change into the directory and run terraform init
```
cd cptc2023-network-openstack && terraform init
```

Create a ``terraform.tfvars`` file for these variables:
- credential_id
- credential_secret
- auth_url
- region
- external_network

Run terraform apply to watch the network build:
```
terraform apply
```

At the end of the build, the externally accessible ip of the kali machine is printed to the terraform output under ``kali-external-ip``. The kali machine is accessible via kali:kali or ssh key specified.