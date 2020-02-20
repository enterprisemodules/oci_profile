# Docs TODO
class oci_profile::instances(
  Hash $list,
  Hash $defaults,
) inherits oci_profile {
  echo {"OCI instance(s) ${list.keys.join(',')} ": withpath => false}
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nightmare. Our advise is when you need
  # to let puppet manage your instances , to override this class and 
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  create_resources(oci_core_instance, $list, $defaults)
}
