# == Class: liferay::install
#
#
class liferay::install (
  $version                 ,
) inherits liferay::params {

  # download liferay source
  staging::file { "liferay-portal-${version}.war":
    source  => $::liferay::params::downloadlinks[$version]['release_download_link'],
    timeout => 1800,
  }
  ~>
  # make liferay source available
  exec {'chmod_liferay_portal_war':
    path        => ['/usr/local/bin','/usr/bin','/bin'],
    cwd         => '/opt/staging',
    command     => 'chmod -R o+rX liferay',
    refreshonly => true,
  }
  ~>
  # stop already running tomcat
  exec {'stop_tomcat7_before_root_removal':
    path        => ['/usr/local/bin','/usr/bin','/bin'],
    cwd         => '/var/lib/tomcat7/webapps',
    command     => '/etc/init.d/tomcat7 stop || true',
    refreshonly => true,
  }
  ->
  # remove default tomcat root
  exec {'remove_default_tomcat7_root':
    path    => ['/usr/local/bin','/usr/bin','/bin'],
    cwd     => '/var/lib/tomcat7/webapps',
    command => 'rm -rf ROOT',
    unless  => "ls /var/lib/tomcat7/webapps/ROOT/liferay-${version}.dariah",
  }
  ->
  # put liferay into tomcat root
  exec {'extract_liferay':
    path    => ['/usr/local/bin','/usr/bin','/bin'],
    user    => 'tomcat7',
    group   => 'tomcat7',
    command => "unzip -d ROOT /opt/staging/liferay/liferay-portal-${version}.war",
    cwd     => '/var/lib/tomcat7/webapps',
    unless  => 'ls /var/lib/tomcat7/webapps/ROOT/WEB-INF/liferay-web.xml',
  }
  ->
  file { "/var/lib/tomcat7/webapps/ROOT/liferay-${version}.dariah":
    ensure => present,
  }
  ->
  augeas { 'lifery_session_timeout_5_min':
    incl     =>  '/files/var/lib/tomcat7/webapps/ROOT/WEB-INF/web.xml',
    context  =>  '/files/var/lib/tomcat7/webapps/ROOT/WEB-INF/web.xml/web-app',
    lens     => "Xml.lns",
    changes   => [
      "set session-config/session-timeout/#text 5",
    ],
  }

}

