# == Class: liferay::service
#
#
class liferay::service (
) inherits liferay::params {

  service { 'tomcat7':
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

}

