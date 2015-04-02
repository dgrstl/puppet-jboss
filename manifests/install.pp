define jboss::install (
  $version,
  $user,
  $group,
  $basedir,
  $install_source = '',
) {

  $install_source = $install_source ? {
    '' => $version ? {
      '4' => 'http://sourceforge.net/projects/jboss/files/JBoss/JBoss-4.2.3.GA/jboss-4.2.3.GA.zip',
      '5' => 'http://sourceforge.net/projects/jboss/files/JBoss/JBoss-5.1.0.GA/jboss-5.1.0.GA.zip',
      '6' => 'http://download.jboss.org/jbossas/6.1/jboss-as-distribution-6.1.0.Final.zip',
      '7' => 'http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.zip',
    },
    default => $jboss::install_source,
  }

  notify { 'install_source' : message => $install_source }
  #$zipfile = "${version}.zip"
  #$subdir  = $version
  #if ! defined(Package['unzip']) {
  #  package { 'unzip': ensure => installed }
  #}
  #if ! defined(Package['rsync']) {
  #  package { 'rsync': ensure => installed }
  #}
  #if ! defined(Package['sed']) {
  #  package { 'sed': ensure => installed }
  #}
  # defaults
  #File {
  #  owner => $user,
  #  group => $group,
  #}
  #file { "jboss-zipfile-${version}":
  #  ensure  => present,
  #  path    => "/root/jboss/${zipfile}",
  #  mode    => '0444',
  #  source  => "puppet:///files/jboss/${zipfile}",
  #  require => File['/root/jboss'],
  #}
  #if ! defined(File["${basedir}/product"]) {
  #  file { "${basedir}/product":
  #    ensure => directory,
  #    mode   => '0750',
  #  }
  #}
  #exec { "jboss-unpack-${version}":
  #  cwd     => "${basedir}/product",
  #  command => "/usr/bin/unzip '/root/jboss/${zipfile}'",
  #  creates => "${basedir}/product/${subdir}",
  #  notify  => Exec["jboss-fix-ownership-${version}"],
  #  require => File["jboss-zipfile-${version}", "${basedir}/product"],
  #}
  #file { "${basedir}/product/${subdir}":
  #  ensure  => directory,
  #  require => Exec["jboss-unpack-${version}"],
  #}
  #exec { "jboss-fix-ownership-${version}":
  #  command     => "/bin/chown -R ${user}:${group} ${basedir}/product/${subdir}",
  #  refreshonly => true,
  #}
}
