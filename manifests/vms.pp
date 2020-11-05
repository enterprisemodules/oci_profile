# Docs TODO
class oci_profile::vms(
  Hash $list,
) inherits oci_profile {

  easy_type::debug_evaluation()

  oci_profile::echo {'ensuring OCI VM(s)': list => $list }
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nightmare. Our advise is when you need
  # to let puppet manage your VM object , to override this class and 
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  create_resources(oci_profile::vm, $list)
}
