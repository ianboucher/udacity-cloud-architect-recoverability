## Stretch Goal - Create RDS database via CloudFormation or Terraform

To meet this strech goal, an RDS instance mirroring the configuration of the one created via the console earlier in the project was created using a simple Terraform script.

### Content
- Screenshot `primaryDB_config_tf.png` showing the configuration of the DB in the AWS console view following its creation via Terrform
- Terraform file `main.tf` - the script detailing the creation & configuration of the RDS resource
- Terraform file `variables.tf` - a file containing configuration variables for use in `main.tf`
- Terraform file `backend.tf` - a file detailing the S3 bucket to be used to store Terraform state
- Terraform file `ouputs.tf` - unused