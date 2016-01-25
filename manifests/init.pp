# == Class: controlplane
#
# Install controlplane
#
class controlplane (
  $install_path = "/Users/${::boxen_user}/Applications/ControlPlane.app",
) {
  package { 'controlplane':
    provider => 'brewcask'
  } ->
  osx_login_item { 'ControlPlane':
    hidden => true,
    path   => $install_path
  } ~>
  exec { 'launch controlplane':
    command     => "/usr/bin/open ${install_path}",
    refreshonly => true,
  }
}
