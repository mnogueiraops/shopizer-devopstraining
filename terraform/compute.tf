resource "oci_core_instance" "shopizer_instance" {
    # Required
    availability_domain = var.availability_domain
    compartment_id = var.compartment_id
    shape = "VM.Standard.A1.Flex"

    shape_config {

        #Optional
        memory_in_gbs = "4"
        ocpus = "1"
    }

    source_details {
        source_id = "ocid1.image.oc1.sa-vinhedo-1.aaaaaaaab7as7ele2z6vt6ghoi5asnopnchqvjwjklxkz5bypu2uepyduyxa"
        source_type = "image"
    }

    # Optional
    display_name = "shopizer-devops"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.vcn-public-subnet.id
    }
    metadata = {
        ssh_authorized_keys = file("/home/marcos/repos/minecraft-server.pub")
    } 
    preserve_boot_volume = false
}