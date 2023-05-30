# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list

resource "oci_core_security_list" "private-security-list"{

# Required
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaeji7lmv6yrejwphcmajsuq5vabnrwpf474nctns5wu3pgsgyxukq"
  vcn_id = module.vcn.vcn_id

# Optional
  display_name = "security-list-for-private-subnet"
}