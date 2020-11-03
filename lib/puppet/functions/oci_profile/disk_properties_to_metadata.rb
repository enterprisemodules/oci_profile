Puppet::Functions.create_function('oci_profile::disk_properties_to_metadata') do
    dispatch :disk_properties_to_metadata do
      param       'Hash',      :disks
      return_type 'Hash'
    end
  
    def disk_properties_to_metadata(disks)
      return_value = {}
      disks.each do | disk, properties|
        return_value[disk] = {}
        return_value[disk]['device']      = properties['device']
        return_value[disk]['mount_point'] = properties['mount_point']
      end
      Puppet.debug "disk_properties_to_metadata: Converted '#{disks.inspect}' to '#{return_value.inspect}'"
      return_value
    end
  end
  