# Docs TODO
class oci_profile::compartments(
  Hash $list,
) inherits oci_profile {
  echo {"OCI compartment(s) ${list.keys.join(',')} ": withpath => false}
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nightmare. Our advise is when you need
  # to let puppet manage your compartments , to override this class and 
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  create_resources(oci_identity_compartment, $list)
}
