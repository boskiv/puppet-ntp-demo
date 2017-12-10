# Ntp config class
# Used to prepare config file.
# Take params from hierra to manage different OS,
# different geolocation for nodes
# different admin group name to chown file rigths
# And also notify service on file change

class ntp::config (
  $ntp_local_server,
  $ntp_regional_server,
  $ntp_monitor,
  $admingroup,
)  {

  file { '/etc/ntp.conf' :
    ensure  => 'file',
    content => epp('ntp/ntp.conf.epp', {
      'monitor'             => $ntp_monitor,
      'ntp_local_server'    => $ntp_local_server,
      'ntp_regional_server' => $ntp_regional_server, }
    ),
    owner   => 'root',
    group   => $admingroup,
    mode    => '0664',
    notify  => Class['ntp::service'],
  }

# ERB template example
  # file { '/etc/ntp.conf' :
  #   ensure  => 'file',
  #   content => template('ntp/ntp.conf.erb'),
  #   owner   => 'root',
  #   group   => $admingroup,
  #   mode    => '0664',
  #   notify  => Class['ntp::service'],
  # }


}
