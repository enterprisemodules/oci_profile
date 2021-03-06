# Docs TODO
class oci_profile::file_storage(
  Hash $file_system_list,
  Hash $export_list,
) inherits oci_profile {

  easy_type::debug_evaluation()

  oci_profile::utils::echo {'ensuring OCI file system(s)': list => $file_system_list }
  oci_profile::utils::echo {'ensuring OCI export(s)': list => $export_list }
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nightmare. Our advise is when you need
  # to let puppet manage your file systems and exports , to override this class and 
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  create_resources(oci_file_storage_file_systemt, $file_system_list)
  create_resources(oci_file_storage_export, $export_list)
}
