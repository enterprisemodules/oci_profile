# Docs TODO
class oci_profile::key_management(
  Hash $vault_list,
  Hash $key_list,
) inherits oci_profile {

  easy_type::debug_evaluation()

  oci_profile::utils::echo {'ensuring OCI vault(s)': list => $vault_list }
  oci_profile::utils::echo {'ensuring OCI key(s)': list => $key_list }
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nightmare. Our advise is when you need
  # to let puppet manage your keys, to override this class and 
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  create_resources(oci_key_management_vault, $vault_list)
  create_resources(oci_key_management_key, $key_list)
}
