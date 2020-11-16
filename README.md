# Project Objectives - Data Durability and Recovery

This focus of this project was build a Multi-AvailabilityZone, Multi-Region database and show how to use it in multiple geographically separate AWS regions.  In addition, a basic static website hosting solution with file versioning was implemented so that any data destruction and accidents could be quickly and easily undone.

<br/>

## Project Content

This repo contains:
- A CloudFormation script to build an AWS VPC with public and private subnets  
- Files with which to build an example static website hosted in an AWS S3 bucket
- Screenshots of the AWS console at each stage of the VPC, RDS, EC2 & S3 configurations
- A [Stretch Goals](sretch-goals) directory detailing: 
  - Configuration & .tf files for building the RDS instance via Terraform (under `/strech-goals/terraform/`)
  - Configuration of a VPC peering connection between VPC in different regions (under `/strech-goals/vpc-peering-connection/`)
  - Configuration of a Cloudfront distribution to serve the example static website from Edge Locations (under `/strech-goals/cloudfront/`)

<br/>

### Active & Standby VPCs

In order to achieve the highest levels of durability and availability in AWS you must take advantage of multiple AWS regions. To this end, the first step in this project was to build a VPCs in two regions - a "Primary" in the active region and a "Secondary" in the standby region for failover purposes. Screenshots showing the completed VPC confuration can be seen in under the `/screenshots` directory.

The VPCs were created in each region using the CloudFormation script in this repo. The original, along with detailed instructions for its use can be found in the folowing repo: https://github.com/udacity/nd063-c2-design-for-availability-resilience-reliability-replacement-project-starter-template/blob/master/cloudformation/vpc.yaml

**NOTE**: Different CIDR address ranges for each VPC were necessary to enable a peering connection between them.

<br/>

### Highly Durable RDS Database
The creation of a resiliant, highly available database consisted of the creation of an RDS Subnet Group in the active and standby regions, followed by the creation of a new MySQL, multi-AZ database in the active region, along with a a read replica database in the standby region. Screenshots showing the completed RDS confuration can be seen in under the `/screenshots` directory.

<br/>

### Estimates for Availability of this DB Configuration
Brief estimates for Recovery Time Objective (RTO) and Recovery Point Objective (RPO) for this multi-AZ, multi-region database in terms of single AZ and single regions outages can be found in `estimates.txt`

<br/>

### Demonstration of Normal Usage (Active Region)
To demonstrate normal operation of the database an EC2 instance was launched in the active region, and configured to use the Primary VPC's public subnet and security group. From the running EC2 intance, a connection to the RDS database was established in order to create a table and demonstrate read & write operations to the database. Screenshots showing the completed EC2 confuration can be seen in under the `/screenshots` directory, along with screenshots showing the montitoring of connections to and replication of the DB. The log of the read & write DB operations can be found in `log_primary.txt`.

<br/>

### DB Failover And Recovery
To demonstrate a simulated recovery by failing over to the RDS read replica in the standby region, a 2nd EC2 instance was launched and connected to the read replica, before promoting that read replica. Screenshots showing the RDS confuration before and after promotion can be seen in under the `/screenshots` directory. Logs of DB read & write operations before and after promotion can be found in `log_rr_before_promotion.txt` and `log_rr_after_promotion.txt`

<br/>

### Website Resiliency
To demonstrate resiliant deployment of a static website, static files and images were hosted via a versioned S3 bucket. By simulating erroneous changes & deletions to the static files, recovery could be demonstrated by using S3's versioning to revert the files to their correct configuration, thus ensuring the website continued to be served correctly. Screenshots showing the S3 confuration and the website in each state or failure/recovery can be seen in under the `/screenshots` directory.
Build a resilient static web hosting solution in AWS. Create a versioned S3 bucket and configure it as a static website.
