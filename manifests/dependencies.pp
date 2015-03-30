# == Class: liferay::dependencies
#
#
class liferay::dependencies (
  $version                       ,
) inherits liferay::params {

  staging::file { "liferay-portal-src-${version}.zip":
    source => $::liferay::params::downloadlinks[$version]['src_download_link']
  }

  staging::file { "liferay-portal-dependencies-${version}.zip":
    source => $::liferay::params::downloadlinks[$version]['dependencies_download_link']
  }

  staging::extract { "liferay-portal-src-${version}.zip":
    target  => '/opt/staging',
    creates => "/opt/staging/liferay-portal-src-${version}",
    require => Staging::File["liferay-portal-src-${version}.zip"],
  }

  staging::extract { "liferay-portal-dependencies-${version}.zip":
    target  => '/opt/staging',
    creates => "/opt/staging/liferay-portal-dependencies-${version}",
    require => Staging::File["liferay-portal-dependencies-${version}.zip"],
  }

  file { '/usr/share/tomcat7/lib/ext/hsql.jar':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-dependencies-${version}/hsql.jar",
    notify  => Service['tomcat7'],
    require => [File['/usr/share/tomcat7/lib/ext'],Staging::Extract["liferay-portal-dependencies-${version}.zip"]],
  }
  file { '/usr/share/tomcat7/lib/ext/portal-service.jar':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-dependencies-${version}/portal-service.jar",
    notify  => Service['tomcat7'],
    require => [File['/usr/share/tomcat7/lib/ext'],Staging::Extract["liferay-portal-dependencies-${version}.zip"]],
  }
  file { '/usr/share/tomcat7/lib/ext/portlet.jar':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-dependencies-${version}/portlet.jar",
    notify  => Service['tomcat7'],
    require => [File['/usr/share/tomcat7/lib/ext'],Staging::Extract["liferay-portal-dependencies-${version}.zip"]],
  }

  file { '/usr/share/tomcat7/lib/ext/activation.jar':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-src-${version}/lib/development/activation.jar",
    notify  => Service['tomcat7'],
    require => [File['/usr/share/tomcat7/lib/ext'],Staging::Extract["liferay-portal-src-${version}.zip"]],
  }
  file { '/usr/share/tomcat7/lib/ext/ccpp.jar':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-src-${version}/lib/portal/ccpp.jar",
    notify  => Service['tomcat7'],
    require => [File['/usr/share/tomcat7/lib/ext'],Staging::Extract["liferay-portal-src-${version}.zip"]],
  }
  file { '/usr/share/tomcat7/lib/ext/jms.jar':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-src-${version}/lib/development/jms.jar",
    notify  => Service['tomcat7'],
    require => [File['/usr/share/tomcat7/lib/ext'],Staging::Extract["liferay-portal-src-${version}.zip"]],
  }
  file { '/usr/share/tomcat7/lib/ext/jta.jar':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-src-${version}/lib/development/jta.jar",
    notify  => Service['tomcat7'],
    require => [File['/usr/share/tomcat7/lib/ext'],Staging::Extract["liferay-portal-src-${version}.zip"]],
  }
  file { '/usr/share/tomcat7/lib/ext/jutf7.jar':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-src-${version}/lib/development/jutf7.jar",
    notify  => Service['tomcat7'],
    require => [File['/usr/share/tomcat7/lib/ext'],Staging::Extract["liferay-portal-src-${version}.zip"]],
  }
  file { '/usr/share/tomcat7/lib/ext/mail.jar':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-src-${version}/lib/development/mail.jar",
    notify  => Service['tomcat7'],
    require => [File['/usr/share/tomcat7/lib/ext'],Staging::Extract["liferay-portal-src-${version}.zip"]],
  }
  file { '/usr/share/tomcat7/lib/ext/mysql.jar':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-src-${version}/lib/development/mysql.jar",
    notify  => Service['tomcat7'],
    require => [File['/usr/share/tomcat7/lib/ext'],Staging::Extract["liferay-portal-src-${version}.zip"]],
  }
  file { '/usr/share/tomcat7/lib/ext/persistence.jar':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-src-${version}/lib/development/persistence.jar",
    notify  => Service['tomcat7'],
    require => [File['/usr/share/tomcat7/lib/ext'],Staging::Extract["liferay-portal-src-${version}.zip"]],
  }
  file { '/usr/share/tomcat7/lib/ext/postgresql.jar':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-src-${version}/lib/development/postgresql.jar",
    notify  => Service['tomcat7'],
    require => [File['/usr/share/tomcat7/lib/ext'],Staging::Extract["liferay-portal-src-${version}.zip"]],
  }

  file { '/usr/share/tomcat7/temp/liferay/com/liferay/portal/deploy/dependencies/resin.jar':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-src-${version}/lib/development/resin.jar",
    notify  => Service['tomcat7'],
    require => [File['/usr/share/tomcat7/temp/liferay/com/liferay/portal/deploy/dependencies'],Staging::Extract["liferay-portal-src-${version}.zip"]],
  }
  file { '/usr/share/tomcat7/temp/liferay/com/liferay/portal/deploy/dependencies/script-10.jar':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-src-${version}/lib/development/script-10.jar",
    notify  => Service['tomcat7'],
    require => [File['/usr/share/tomcat7/temp/liferay/com/liferay/portal/deploy/dependencies'],Staging::Extract["liferay-portal-src-${version}.zip"]],
  }

  file { '/var/lib/tomcat7/data/osgi/portal/org.apache.felix.scr.jar':
    ensure  => present,
    owner   => 'tomcat7',
    group   => 'tomcat7',
    mode    => '0644',
    source  => "/opt/staging/liferay-portal-src-${version}/osgi/lib/common/portal/org.apache.felix.scr.jar",
    notify  => Service['tomcat7'],
    require => [File['/var/lib/tomcat7/data/osgi/portal'],Staging::Extract["liferay-portal-src-${version}.zip"]],
  }

  ##### all those folders...
  file { '/usr/share/tomcat7/lib/ext':
    ensure  => directory,
    owner   => root,
    group   => root,
    require => Package['tomcat7'],
  }
  file {'/var/lib/tomcat7/data':
    ensure  => directory,
    owner   => 'tomcat7',
    group   => 'tomcat7',
    require => Package['tomcat7'],
  }
  file {'/var/lib/tomcat7/data/osgi':
    ensure  => directory,
    owner   => 'tomcat7',
    group   => 'tomcat7',
    require => File['/var/lib/tomcat7/data'],
  }
  file {'/var/lib/tomcat7/data/osgi/portal':
    ensure  => directory,
    owner   => 'tomcat7',
    group   => 'tomcat7',
    require => File['/var/lib/tomcat7/data/osgi'],
  }
  file {'/var/lib/tomcat7/deploy':
    ensure  => directory,
    owner   => 'tomcat7',
    group   => 'tomcat7',
    require => Package['tomcat7'],
  }
  file {'/usr/share/tomcat7/temp/liferay/com/liferay/portal/deploy/dependencies':
    ensure  => directory,
    owner   => 'tomcat7',
    group   => 'tomcat7',
    require => File['/usr/share/tomcat7/temp/liferay/com/liferay/portal/deploy'],
  }
  file {'/usr/share/tomcat7/temp/liferay/com/liferay/portal/deploy':
    ensure  => directory,
    owner   => 'tomcat7',
    group   => 'tomcat7',
    require => File['/usr/share/tomcat7/temp/liferay/com/liferay/portal'],
  }
  file {'/usr/share/tomcat7/temp/liferay/com/liferay/portal':
    ensure  => directory,
    owner   => 'tomcat7',
    group   => 'tomcat7',
    require => File['/usr/share/tomcat7/temp/liferay/com/liferay'],
  }
  file {'/usr/share/tomcat7/temp/liferay/com/liferay':
    ensure  => directory,
    owner   => 'tomcat7',
    group   => 'tomcat7',
    require => File['/usr/share/tomcat7/temp/liferay/com'],
  }
  file {'/usr/share/tomcat7/temp/liferay/com':
    ensure  => directory,
    owner   => 'tomcat7',
    group   => 'tomcat7',
    require => File['/usr/share/tomcat7/temp/liferay'],
  }
  file {'/usr/share/tomcat7/temp/liferay':
    ensure  => directory,
    owner   => 'tomcat7',
    group   => 'tomcat7',
    require => File['/usr/share/tomcat7/temp'],
  }
  file {'/usr/share/tomcat7/temp':
    ensure  => directory,
    owner   => 'tomcat7',
    group   => 'tomcat7',
    require => Package['tomcat7'],
  }


}

