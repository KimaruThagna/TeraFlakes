terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.15"
    }
  }
}

provider "snowflake" {
  // required
  username = "your username"
  account  = "your account"
  region   = "east-us-2.azure"
  password = "your password"
  // optional
  role = "desired_role"
}

#create database
resource "snowflake_database" "transactional_db" {
  name = "transactions_db"
}
# create role
resource "snowflake_role" "looker_bi_role" {
  name = "looker"
}
# create user
resource "snowflake_user" "looker_user" {
  name         = "Looker"
  comment      = "The account Looker will be using to access transactional data for analysis"
  password     = "secret"
  default_role = snowflake_role.looker_bi_role.name
}

# grant
resource "snowflake_role_grants" "looker_role_grant" {
  role_name = snowflake_role.looker_bi_role.name
  users     = ["ADMIN", snowflake_user.looker_user.name] # list of existing users who can have this role
}