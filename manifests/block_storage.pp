# Docs TODO
class oci_profile::block_storage(
  Hash $volume_defaults,
  Hash $volume_list,
  Hash $volume_group_defaults,
  Hash $volume_group_list,
  Hash $volume_backup_defaults,
  Hash $volume_backup_list,
  Hash $volume_backup_policy_defaults,
  Hash $volume_backup_policy_list,
) inherits oci_profile {

  easy_type::debug_evaluation()

  oci_profile::utils::echo {'ensuring OCI volume(s)': list => $volume_list }
  oci_profile::utils::echo {'ensuring OCI volume group(s)': list => $volume_group_list }
  oci_profile::utils::echo {'ensuring OCI volume backup(s)': list => $volume_backup_list }
  oci_profile::utils::echo {'ensuring OCI volume backups policy(ies)': list => $volume_backup_policy_list }
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nightmare. Our advise is when you need
  # to let puppet manage your block storage , to override this class and 
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  create_resources(oci_core_volume, $volume_list, $volume_defaults)
  create_resources(oci_core_volume_group, $volume_group_list, $volume_group_defaults)
  create_resources(oci_core_backup_volume, $volume_backup_list, $volume_backup_defaults)
  create_resources(oci_core_backup_volume_policy, $volume_backup_policy_list, $volume_backup_policy_defaults)
}
