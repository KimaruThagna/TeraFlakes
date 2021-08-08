terraform {
  required_version = ">=0.12"
}

module "looker_on_snowflake"{
  source = "./modules/snowflake_spinup"
  username = "snowflake_BI"
  account = "looker_bi"
  password = "dummy password"
  role = "analyst"
  warehouse_name = "analytics_bi"
  database = "transactions"
  db_role = "admin"
  db_username = "looker_admin"
  db_password = "dummy password"
}