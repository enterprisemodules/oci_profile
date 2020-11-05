# Docs TODO
class oci_profile::identity(
  Hash $user_list,
  Hash $group_list,
  Hash $dynamic_group_list,
  Hash $tag_name_space_list,
  Hash $tag_list,
) inherits oci_profile {
  echo {"OCI user(s) ${user_list.keys.join(',')} ": withpath => false}
  echo {"OCI group(s) ${group_list.keys.join(',')} ": withpath => false}
  echo {"OCI dynamic group(s) ${dynamic_group_list.keys.join(',')} ": withpath => false}
  echo {"OCI tag name space(s) ${tag_name_space_list.keys.join(',')} ": withpath => false}
  echo {"OCI tag(s) ${tag_name_space_list.keys.join(',')} ": withpath => false}
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nightmare. Our advise is when you need
  # to let puppet manage your identity object , to override this class and 
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  create_resources(oci_identity_user, $user_list)
  create_resources(oci_identity_group, $group_list)
  create_resources(oci_identity_dynamic_group, $dynamic_group_list)
  create_resources(oci_identity_tag_namespace, $tag_name_space_list)
  create_resources(oci_identity_tag, $tag_list)
}
