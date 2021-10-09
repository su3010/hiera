variable "fact" {
  description = "facts"
  type = object({
      environment = string
      role = string
      hostname = string })
    default =     {
      environment = "live"
      role = "mssql"
      hostname = "tcp"
    }
  
}