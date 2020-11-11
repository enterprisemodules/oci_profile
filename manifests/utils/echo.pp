define oci_profile::utils::echo(
  Hash    $list,
  Integer $display_max = 10,
){
  if $list.keys.size < $display_max {
    $message = "${title}: ${list.keys.join(',')}"
  } else {
    $message = $title
  }
  if $list.keys.size > 0 {
    echo {$message:
      withpath => false,
    }
  }
}
