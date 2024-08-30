provider "aws" {
region="us-east-2"
}

module "webserver_cluster"{
source="github.com/ckctommy0914/TerraformUD//?ref=v0.0.1"

ami = "ami-0fb653ca2d3203ac1"
server_text = "TESTTSTTTT foo new text boooooooooooo!"


cluster_name="webservers-stage"
db_remote_state_bucket="08122024bucketterraformch3"
db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"

instance_type="t2.micro"
min_size = 2
max_size = 2
enable_autoscaling =false

custom_tags={
Owner ="team-foo"
Managedby="Terraform"
}
}

resource "aws_security_group_rule" "allow_testing_inbound" {
 type = "ingress"
 security_group_id = module.webserver_cluster.alb_security_group_id
 from_port = 12345
 to_port = 12345
 protocol = "tcp"
 cidr_blocks = ["0.0.0.0/0"]
}




