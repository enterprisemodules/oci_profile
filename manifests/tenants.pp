# Docs TODO
class oci_profile::tenants(
  Hash $list,
) inherits oci_profile {

  easy_type::debug_evaluation()

  oci_profile::utils::echo {'ensuring OCI tenant(s)': list => $list }
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nightmare. Our advise is when you need
  # to let puppet manage your tenants , to override this class and 
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  create_resources(oci_tenant, $list)
}
