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
  if $java_version == 'oracle-jdk8' {

    # copied from https://github.com/Spantree/puppet-java8/blob/master/manifests/init.pp
    # ubuntu specific, for debian look at above link
    # accept license
    file { '/tmp/java.preseed':
      source => 'puppet:///modules/liferay/oracle-java.preseed',
      mode   => '0600',
      backup => false,
    }

    apt::ppa { 'ppa:webupd8team/java': }

    package {
      'oracle-java8-installer':
        ensure       => present,
        responsefile => '/tmp/java.preseed',
        require      => [Apt::Ppa['ppa:webupd8team/java'],File['/tmp/java.preseed']],
        notify       => Service['tomcat7'],
    }
    ->
    package {
      'oracle-java8-set-default':
        ensure => present,
        notify => Service['tomcat7'],
    }
    ->
    package {
      'openjdk-7-jdk':            ensure => absent;
      'openjdk-7-jre':            ensure => absent;
      'openjdk-7-jre-headless':   ensure => absent;
      'openjdk-7-jre-lib':        ensure => absent;
      'openjdk-6-jre-headless':   ensure => absent;
    }

  }

  package { 'tomcat7':
    ensure => present
  }


}

