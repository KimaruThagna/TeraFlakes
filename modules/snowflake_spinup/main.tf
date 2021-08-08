required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.15"
    }
  }
provider "snowflake" {
  // required
  username = var.username
  account  = var.account
  region   = var.region
  password = var.password
  // optional
  role = var.role
}
# warehouse
resource snowflake_warehouse "default_warehouse" {
  name           = var.warehouse_name
  comment        = "Where analytics happens"
  warehouse_size = var.warehouse_size
}
#create database
resource "snowflake_database" "transactional_db" {
  name = var.database
}
# create role
resource "snowflake_role" "db_role" {
  name = var.db_role
}
# create user
resource "snowflake_user" "db_user" {
  name         = var.db_user
  comment      = "The account Looker will be using to access transactional data for analysis"
  password     = var.db_password
  default_role = snowflake_role.db_role.name
  default_warehouse = snowflake_warehouse.default_warehouse.name
}

# grant
resource "snowflake_role_grants" "looker_role_grant" {
  role_name = snowflake_role.db_role.name
  users     = ["ADMIN", snowflake_user.db_user.name] # list of existing users who can have this role
}

# create a set of schemas in a single db via a loop
resource snowflake_schema schema {
for_each = var.schema_map
name = each.value
database = snowflake_database.transactional_db.name

}