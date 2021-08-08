
variable "schema_map" {
  description = "Similar schemas created via loop"
  type        = map(any)
  default     = { for schema in ["orders", "shipment", "users"] : schema => schema }
}

variable "username"{
    type = string
    description = ""
    default = ""
}

variable "username"{
    type = string
    description = ""
    default = ""
}
variable "username"{
    type = string
    description = ""
    default = ""
}
variable "username"{
    type = string
    description = ""
    default = ""

}
variable "username"{
    type = string
    description = ""
    default = ""
}
variable "username"{
    type = string
    description = ""
    default = ""
}
variable "username"{
    type = string
    description = ""
    default = ""
}