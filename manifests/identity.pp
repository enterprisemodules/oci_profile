# Docs TODO
class oci_profile::identity(
  Hash $user_list,
  Hash $group_list,
  Hash $dynamic_group_list,
  Hash $tag_name_space_list,
  Hash $tag_list,
) inherits oci_profile {

  easy_type::debug_evaluation()

  oci_profile::utils::echo {'ensuring OCI user(s)': list => $user_list }
  oci_profile::utils::echo {'ensuring OCI group(s)': list => $group_list }
  oci_profile::utils::echo {'ensuring OCI dynamic group(s)': list => $dynamic_group_list }
  oci_profile::utils::echo {'ensuring OCI tag name space(s)': list => $tag_name_space_list }
  oci_profile::utils::echo {'ensuring OCI tag(s)': list => $tag_list }
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nightmare. Our advise is when you need
  # to let puppet manage your identity object , to override this class and 
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  # create_resources(oci_identity_user, $user_list)
  create_resources(oci_identity_group, $group_list)
  create_resources(oci_identity_dynamic_group, $dynamic_group_list)
  create_resources(oci_identity_tag_namespace, $tag_name_space_list)
  create_resources(oci_identity_tag, $tag_list)
}
