#
# Create a VM like set of OCI structures
#
define oci_profile::vm(
  Enum['present','absent']
            $ensure              = 'present',
  String[1] $tenant              = lookup('oci_profile::vm::tenant'),
  String[1] $region              = lookup('oci_profile::vm::region'),
  String[1] $availability_domain = lookup('oci_profile::vm::availability_domain'),
  String[1] $compartment         = lookup('oci_profile::vm::compartment'),
  String[1] $subnet              = lookup('oci_profile::vm::subnet'),
  String[1] $puppetserver        = lookup('oci_profile::vm::puppetserver'),
  Optional[String[1]]
            $role                = lookup('oci_profile::vm::role'),
  Optional[String[1]]
            $node_type           = lookup('oci_profile::vm::node_type', String, undef, undef),
  Optional[Array[String[1]]]
            $additional_profiles = lookup('oci_profile::vm::additional_profiles', Array, undef, []),
  String[1] $image               = lookup('oci_profile::vm::image'),
  String[1] $ssh_authorized_keys = lookup('oci_profile::vm::ssh_authorized_keys'),
  Hash      $disks               = lookup('oci_profile::vm::disk'),
  Hash      $disk_defaults       = lookup('oci_profile::vm::disk_defaults'),
  Hash      $instance_defaults   = lookup('oci_profile::vm::instance_defaults'),
){
  $sanetized_name        = $name.regsubst('_', '-', 'G')

  if $compartment == '' or $compartment == '/' {
    $full_instance_name     = "${tenant}/${name}"
  } else {
    $full_instance_name     = "${tenant}/${compartment}/${name}"
  }
  $custom_disk_properties = ['mount_point', 'device']
  $install_puppet         = "#!/bin/bash\ncurl -k https://${puppetserver}:8140/packages/current/install.bash | sudo bash"

  easy_type::debug_evaluation() # Show local variable on extended debug

  $disks.each |$disk, $info| {
    $disk_info      = $info.delete($custom_disk_properties).deep_merge($disk_defaults)
    $full_disk_name = "${full_instance_name}_${disk}"
    if $ensure == 'present' {
      $before = "Oci_core_instance[${full_instance_name}]"
      $require = undef
    } else {
      $before = undef
      $require = "Oci_core_instance[${full_instance_name}]"
    }

    oci_core_volume { $full_disk_name:
      ensure              => $ensure,
      availability_domain => $availability_domain,
      *                   => $disk_info,
      before              => $before,
      require             => $require,
    }
  }

  oci_core_instance { $full_instance_name:
    ensure              => $ensure,
    availability_domain => $availability_domain,
    volumes             => oci_profile::disk_properties_to_volumes($name, $compartment, $disks),
    launch_mode         => 'NATIVE',
    ssh_authorized_keys => $ssh_authorized_keys,
    user_data           => $install_puppet,
    freeform_tags       => {
                            'disk_info'           => oci_profile::disk_properties_to_metadata($disks),
                            'role'                => $role,
                            'node_type'           => $node_type,
                            'additional_profiles' => $additional_profiles,
                           },
    region              => $region,
    source_details      => { source_type => 'image', image_type => 'image', image => $image },
    vnics               => {'nic1' => {
                              nic_index      => 0,
                              is_primary     => true,
                              subnet         => $subnet,
                              hostname_label => $sanetized_name
                            }},
    *                   => $instance_defaults,
  }
}
