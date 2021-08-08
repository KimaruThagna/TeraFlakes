
variable "schema_map" {
  description = "Similar schemas created via loop"
  type        = map(any)
  default     = { for schema in ["orders", "shipment", "users"] : schema => schema }
}

variable "username"{
    type = string
    description = "Snowflake account username"
    default = "company_test_account"
}

variable "region"{
    type = string
    description = "Server region"
    default = "east-us-2.azure"
}
variable "account"{
    type = string
    description = "Account name"
    default = "company_default_account"
}
variable "password"{
    type = string
    description = "password"
    default = "company_default_password"

}

variable "role"{
    type = string
    description = "role"
    default = "company_default_role"

}

#warehouse
variable "warehouse_name"{
    type = string
    description = "Default warehouse"
    default = "company_default_warehouse"
}
variable "warehouse_size"{
    type = string
    description = "Warehouse size"
    default = "small"
}
#database
variable "database"{
    type = string
    description = "Database"
    default = "analytics"
}

variable "db_role"{
    type = string
    description = "database role"
    default = "company_default_db_role"
}
variable "db_user"{
    type = string
    description = "database username"
    default = "looker"
}
variable "db_password"{
    type = string
    description = "database password"
    default = "company_default_db_password"
}
