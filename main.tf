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
  region   = "us-east-1"
  password = "your password"
  // optional
  role = "desired_role"
}