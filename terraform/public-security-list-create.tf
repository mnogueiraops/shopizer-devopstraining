# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list

resource "oci_core_security_list" "public-security-list"{

# Required
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaeji7lmv6yrejwphcmajsuq5vabnrwpf474nctns5wu3pgsgyxukq"
  vcn_id = module.vcn.vcn_id

# Optional
  display_name = "security-list-for-public-subnet"


#Output rules
egress_security_rules {
      stateless = false
      destination = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      protocol = "all" 
}

    #Input rules

      ingress_security_rules { 
      stateless = false
      source = "177.39.104.26/32"
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
      protocol = "6" 
      tcp_options { 
          min = 22
          max = 22
      } 
      }

      ingress_security_rules { 
      stateless = false
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
      protocol = "6" 
      tcp_options { 
          min = 22
          max = 22
      } 
      }

      ingress_security_rules { 
      stateless = false
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
      protocol = "6"
      tcp_options { 
          min = 25565
          max = 25565 
          }
      }
      ingress_security_rules { 
      stateless = false
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
      protocol = "1"
      }
      }