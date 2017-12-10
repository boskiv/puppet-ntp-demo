# Manage NTP on CentOS and Ubuntu hosts
# Use 2 subclasses config and service
# to manage config file and running service

class ntp (
  $ntp_local_server = 'ntp.prod.env',
  $ntp_regional_server = ['uk.pool.ntp.org'],
  $ntp_monitor = false,
  $ntp_service = 'ntpd',
  $admingroup = 'wheel',
)
  {
    package { 'ntp':
      before => Class['ntp::config'],
    }
    class { 'ntp::config':
      ntp_local_server    => $ntp_local_server,
      ntp_regional_server => $ntp_regional_server,
      ntp_monitor         => $ntp_monitor,
      admingroup          => $admingroup,
    }
    class { 'ntp::service':
      ntp_service => $ntp_service,
    }
  }
