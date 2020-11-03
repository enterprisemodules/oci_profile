$attached_disks = {
  'disk_1_on_u01' => {
    'mount_point' => '/u01',
    'size_in_gbs' => 50,
    'device'      => '/dev/oracleoci/oraclevdb'
  },
  'disk_2_on_u02' => {
    'mount_point' => '/u02',
    'size_in_gbs' => 50,
    'device'      => '/dev/oracleoci/oraclevdc'
  },
  'disk_3_on_u03' => {
    'mount_point' => '/u03',
    'size_in_gbs' => 50,
    'device'      => '/dev/oracleoci/oraclevde'
  }
}

oci_profile::vm {'test_bert7':
  ensure              => 'absent',
  tenant              => 'enterprisemodules (root)',
  region              => 'eu-frankfurt-1',
  availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
  compartment         => '/',
  role                => 'oci_profile::oracledb',
  node_type           => 'db_for_myapp'
  subnet              => 'Public Subnet',
  puppetserver        => 'puppetserver',
  image               => oci_config::latest_image_for('Oracle Linux', '7.8', /^((?!GPU).)*$/),
  ssh_authorized_keys => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpYG7Fv2CHou3mgi4KAiaqY7J+BUKLfv1Ec9RtNjJJwEzoE3AbjSyDj8mUAkNBnO8UL7FIig45tcNyEbTdgx8N9EMQvtOkP1x+nZ6c1mEB6zSO7foRqzigxbhRgJEknRnTErujakjl2XIuxpl/I3E93lFGC8+TuAUCa37iRVkaCM/KF1nGgmcoVYMaFhcqkp+Ayrjo2UBEPlAjSBsxX9kUpbjTi6cm5KIz3Xkcvt6NUcUk+wIsZ+WeeZJXcCRZ9sfUjiufHssTbubDZZjOlnTMU4sggE3S8wBCL09mmCsbHL3NbbvIHWEMDkfMM999sYL3eIzZ9tE1mu1ApoAq4ADF hajee@Berts-MacBook-Pro.local',
  disks               => $attached_disks,
  disk_defaults       => {},
  instance_defaults   => { shape => 'VM.Standard1.1'},
}
