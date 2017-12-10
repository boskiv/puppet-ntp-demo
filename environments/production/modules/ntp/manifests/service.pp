# NTP Service class
# take one param $ntp_service as service name from hierra
# in case of different OS have different service names
# Example: 
#
# RedHat.yml:
# ntp::ntp_server: 'ntpd'
#
# Debian.yml:
# ntp::ntp_server: 'ntp'

class ntp::service (
  $ntp_service,
) {
service {'NTP_Service':
    ensure    => 'running',
    enable    => true,
    name      => $ntp_service,
    subscribe => Class['ntp::config'],
  }
}
