# == Class: liferay::tomcat7
#
#
class liferay::tomcat7 (
  $java_version,
) inherits liferay::params {

  if $java_version == '7' {
    package {
      'openjdk-6-jdk':            ensure => absent;
      'openjdk-6-jre':            ensure => absent;
      'openjdk-6-jre-headless':   ensure => absent;
      'openjdk-6-jre-lib':        ensure => absent;
      'openjdk-7-jre-headless':   ensure => present;
    }
  }
  if $java_version == '6' {
    package {
      'openjdk-7-jdk':            ensure => absent;
      'openjdk-7-jre':            ensure => absent;
      'openjdk-7-jre-headless':   ensure => absent;
      'openjdk-7-jre-lib':        ensure => absent;
      'openjdk-6-jre-headless':   ensure => present;
    }
  }
  package { 'tomcat7':
    ensure => present
  }


}

