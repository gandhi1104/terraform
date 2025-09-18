variable "rgname" {
    type = string
    description = "name of the resource group"
}
variable "rglocation"{
    type = string
    description = "Azure loaction of terraform server environment"
}
variable "prefix"{
    type = string
}
variable "vnet"{
    type = string
    description = "vartual network"
}
variable "vnet_cidr_prefix"{
    type = string
}
variable "subnet" {
    type = string
}
variable "subnet_cidr_prefix"{
    type = string
}