terraform {
  required_providers {
    snowflake = {
      source = "chanzuckerberg/snowflake"
      version = "0.25.15"
    }
  }
}

provider snowflake {
  // required
  username = "your username"
  account  = "your account"
  region   = "east-us-2.azure"
  password = "your password"
  // optional
  role = "desired_role"
}

#create database
resource snowflake_database "transactional_db"{
    name = "transactions_db"
}
# create role
resource snowlake_role "looker_bi_role"{
    name = "looker"
}