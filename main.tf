terraform {
  required_version = ">=0.12"
}

module "webapp_qa_environment"{
  source        = "./modules/webserver"
	name          = "webapp_qa"
	vpc_id        = "741852852"
	cidr_block    = "10.0.0.0/16"
	ami           = "ami-003634241a8fcdec0"
	instance_type = "t2.micro"
}
# snowflake environment for a looker instance
module "looker_on_snowflake"{
  source = "./modules/snowflake_spinup"
  username = "snowflake_BI"
  account = "looker_bi"
  password = "dummy password"
  role = "analyst"
  warehouse_name = "analytics_bi"
  database = "transactions"
  db_role = "admin"
  db_user = "looker_admin"
  db_password = "dummy password"
}

#snowflake environment for the main web application
module "webapp_on_snowflake"{
  source = "./modules/snowflake_spinup"
  username = "webapp_backend"
  account = "web"
  password = "dummy password"
  role = "admin"
  warehouse_name = "webapp"
  database = "webapp_transactions"
  db_role = "admin"
  db_user = "web_admin"
  db_password = "dummy password"
}

#snowflake datalake receiving data from FIVETRAN
module "datalake"{
  source = "./modules/snowflake_spinup"
  username = "fivetran"
  account = "fivetran"
  password = "dummy password"
  role = "admin"
  warehouse_name = "datalake"
  warehouse_size = "large"
  database = "supplychain"
  db_role = "admin"
  db_user = "fivetran"
  db_password = "dummy password"
}
