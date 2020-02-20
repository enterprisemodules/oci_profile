# Docs TODO
class oci_profile::key_management(
  Hash $vault_list,
  Hash $key_list,
) inherits oci_profile {
  echo {"OCI vault(s) ${vault_list.keys.join(',')} ": withpath => false}
  echo {"OCI key(s) ${key_list.keys.join(',')} ": withpath => false}
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
