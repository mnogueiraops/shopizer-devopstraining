# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_subnet

resource "oci_core_subnet" "vcn-public-subnet"{

  # Required
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaeji7lmv6yrejwphcmajsuq5vabnrwpf474nctns5wu3pgsgyxukq"
  vcn_id = module.vcn.vcn_id
  cidr_block = "10.5.1.0/24"
 
  # Optional
  route_table_id = module.vcn.ig_route_id
  security_list_ids = [oci_core_security_list.public-security-list.id]
  display_name = "public-subnet"
}