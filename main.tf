terraform {
  required_providers {
    hiera5 = {
     source = "chriskuchin/hiera5"
      version = "0.2.5"
    }
  }
}



provider "hiera5" {
  # Optional
  config = "hiera.yaml"
  # Optional
  scope = {
    environment = "live"
    service     = "api"
    # Complex variables are supported using pdialect
    facts       = "{timezone=>'CET'}"
  }
  # Optional
  merge  = "deep"
}


data "hiera5_array" "java_opts" {
  key = "java_opts"
}

output "array_test" {
  value = data.hiera5_array.java_opts
}
data "hiera5_bool" "enable_spot_instances" {
  key     = "enable_spot_instances"
  default = false
}
output "hiera_bool_Test" {
  value = data.hiera5_bool.enable_spot_instances
  
}

data "hiera5_hash" "aws_tags" {
  key = "aws_tags"
}

output "hiera5_hash_test" {
  value = data.hiera5_hash.aws_tags
}