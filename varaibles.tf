
variable "schemas"{
    description = "Similar schemas created via loop"
    type = map
    default = {for schema in ["orders","shipment","users"]: schema=>schema}
}