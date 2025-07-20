variable "public_ips" {
    description = "Map of public IPs to create"
    type        = map(object({
        name                = string
        resource_group_name = string
        location            = string
        allocation_method   = optional(string, "Static")
        sku                 = optional(string, "Basic")
        idle_timeout_in_minutes = optional(number, 4)
        tags                = optional(map(string), null)
    }))
}