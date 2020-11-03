Puppet::Functions.create_function('oci_profile::disk_properties_to_volumes') do
  dispatch :disk_properties_to_volumes do
    param       'String[1]', :instance_name
    param       'String[1]', :compartment
    param       'Hash',      :disks
    return_type 'Hash'
  end

  def disk_properties_to_volumes(instance_name, compartment, disks)
    return_value = {}
    disks.each do | disk, properties|
      full_name = compartment.empty? || compartment == '/' ? "#{instance_name}_#{disk}" : "#{compartment}/#{instance_name}_#{disk}"
      return_value[full_name] = {}
      return_value[full_name]['display_name'] = disk
      return_value[full_name]['attachment_type'] = properties['attachment_type'] || 'paravirtualized'
      return_value[full_name]['is_read_only'] = properties['is_read_only'] || false
      return_value[full_name]['device'] = properties['device'] if properties['device']
    end
    Puppet.debug "Converted '#{disks.inspect}' for '#{instance_name}' in '#{compartment}' to '#{return_value.inspect}'"
    return_value
  end
end
