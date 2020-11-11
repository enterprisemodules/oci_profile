#
# Apply a full oci setup 
class oci_profile::configuration(
  Optional[String[1]] $before_tenants        = undef,
  Optional[String[1]] $tenants               = undef,
  Optional[String[1]] $after_tenants         = undef,
  Optional[String[1]] $before_compartments   = undef,
  Optional[String[1]] $compartments          = undef,
  Optional[String[1]] $after_compartments    = undef,
  Optional[String[1]] $before_identity       = undef,
  Optional[String[1]] $identity              = undef,
  Optional[String[1]] $after_identity        = undef,
  Optional[String[1]] $before_key_management = undef,
  Optional[String[1]] $key_management        = undef,
  Optional[String[1]] $after_key_management  = undef,
  Optional[String[1]] $before_budget         = undef,
  Optional[String[1]] $budget                = undef,
  Optional[String[1]] $after_budget          = undef,
  Optional[String[1]] $before_network        = undef,
  Optional[String[1]] $network               = undef,
  Optional[String[1]] $after_network         = undef,
  Optional[String[1]] $before_block_storage  = undef,
  Optional[String[1]] $block_storage         = undef,
  Optional[String[1]] $after_block_storage   = undef,
  Optional[String[1]] $before_object_storage = undef,
  Optional[String[1]] $object_storage        = undef,
  Optional[String[1]] $after_object_storage  = undef,
  Optional[String[1]] $before_file_storage   = undef,
  Optional[String[1]] $file_storage          = undef,
  Optional[String[1]] $after_file_storage    = undef,
  Optional[String[1]] $before_instances      = undef,
  Optional[String[1]] $instances             = undef,
  Optional[String[1]] $after_instances       = undef,
  Optional[String[1]] $vms = undef,
  Optional[String[1]] $before_vms = undef,
  Optional[String[1]] $after_vms = undef,
){

  easy_type::debug_evaluation()

  easy_type::ordered_steps([
    'oci_profile::tenants',
    'oci_profile::compartments',
    'oci_profile::identity',
    'oci_profile::key_management',
    'oci_profile::budget',
    'oci_profile::network',
    'oci_profile::block_storage',
    'oci_profile::object_storage',
    'oci_profile::file_storage',
    'oci_profile::instances',
    'oci_profile::vms',
  ])
}
