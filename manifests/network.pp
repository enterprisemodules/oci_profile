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

  easy_type::debug_evaluation()

  oci_profile::utils::echo { 'ensuring OCI vcn(s)': list => $vcn_list }
  oci_profile::utils::echo { 'ensuring OCI cpe(s)': list => $cpe_list }
  oci_profile::utils::echo { 'ensuring OCI dhcp_options': list => $dhcp_options_list }
  oci_profile::utils::echo { 'ensuring OCI drg(s)': list => $drg_list }
  oci_profile::utils::echo { 'ensuring OCI internet gateway(s)': list => $internet_gateway_list }
  oci_profile::utils::echo { 'ensuring OCI ipsec connection(s)': list => $ip_sec_connection_list }
  oci_profile::utils::echo { 'ensuring OCI local peering gateway(s)': list => $local_peering_gateway_list }
  oci_profile::utils::echo { 'ensuring OCI nat gateway(s)': list => $nat_gateway_list }
  oci_profile::utils::echo { 'ensuring OCI network security group(s)': list => $network_security_group_list }
  oci_profile::utils::echo { 'ensuring OCI public ip(s)': list => $public_ip_list }
  oci_profile::utils::echo { 'ensuring OCI remote peering connection(s)': list => $remote_peering_connection_list }
  oci_profile::utils::echo { 'ensuring OCI route table(s)': list => $route_table_list }
  oci_profile::utils::echo { 'ensuring OCI security list(s)': list => $security_list_list }
  oci_profile::utils::echo { 'ensuring OCI service gateway(s)': list => $service_gateway_list }
  oci_profile::utils::echo { 'ensuring OCI subnet(s)': list => $subnet_list }
  oci_profile::utils::echo { 'ensuring OCI virtual circuit(s)': list => $virtual_circuit_list }
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
