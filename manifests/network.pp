# Docs TODO
class oci_profile::network(
  Hash $cpe_list,
  Hash $dhcp_options_list,
  Hash $drg_list,
  Hash $internet_gateway_list,
  Hash $ip_sec_connection_list,
  Hash $local_peering_gateway_list,
  Hash $nat_gateway_list,
  Hash $network_security_group_list,
  Hash $public_ip_list,
  Hash $remote_peering_connection_list,
  Hash $route_table_list,
  Hash $security_list_list,
  Hash $service_gateway_list,
  Hash $subnet_list,
  Hash $vcn_list,
  Hash $virtual_circuit_list,
) inherits oci_profile {
echo{"OCI vcn(s) ${vcn_list.keys.join(',')} ": withpath => false}
echo{"OCI cpe('s) ${cpe_list.keys.join(',')} ": withpath => false}
echo{"OCI dhcp_options ${dhcp_options_list.keys.join(',')} ": withpath => false}
echo{"OCI drg('s) ${drg_list.keys.join(',')} ": withpath => false}
echo{"OCI internet gateway(s) ${internet_gateway_list.keys.join(',')} ": withpath => false}
echo{"OCI ipsec connection(s) ${ip_sec_connection_list.keys.join(',')} ": withpath => false}
echo{"OCI local peering gateway(s) ${local_peering_gateway_list.keys.join(',')} ": withpath => false}
echo{"OCI nat gateway(s) ${nat_gateway_list.keys.join(',')} ": withpath => false}
echo{"OCI network security group(s) ${network_security_group_list.keys.join(',')} ": withpath => false}
echo{"OCI public ip(s) ${public_ip_list.keys.join(',')} ": withpath => false}
echo{"OCI remote peering connection(s) ${remote_peering_connection_list.keys.join(',')} ": withpath => false}
echo{"OCI route table(s) ${route_table_list.keys.join(',')} ": withpath => false}
echo{"OCI security list(s) ${security_list_list.keys.join(',')} ": withpath => false}
echo{"OCI service gateway(s) ${service_gateway_list.keys.join(',')} ": withpath => false}
echo{"OCI subnet(s) ${subnet_list.keys.join(',')} ": withpath => false}
echo{"OCI virtual circuit(s) ${virtual_circuit_list.keys.join(',')} ": withpath => false}
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nightmare. Our advise is when you need
  # to let puppet manage your network objects , to override this class and 
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  create_resources( oci_core_vcn, $vcn_list)
  create_resources( oci_core_cpe, $cpe_list)
  create_resources( oci_core_dhcp_options, $dhcp_options_list)
  create_resources( oci_core_drg, $drg_list)
  create_resources( oci_core_internet_gateway, $internet_gateway_list)
  create_resources( oci_core_ip_sec_connection, $ip_sec_connection_list)
  create_resources( oci_core_local_peering_gateway, $local_peering_gateway_list)
  create_resources( oci_core_nat_gateway, $nat_gateway_list)
  create_resources( oci_core_network_security_group, $network_security_group_list)
  create_resources( oci_core_public_ip, $public_ip_list)
  create_resources( oci_core_remote_peering_connection, $remote_peering_connection_list)
  create_resources( oci_core_route_table, $route_table_list)
  create_resources( oci_core_security_list, $security_list_list)
  create_resources( oci_core_service_gateway, $service_gateway_list)
  create_resources( oci_core_subnet, $subnet_list)
  create_resources( oci_core_virtual_circuit, $virtual_circuit_list)
}
