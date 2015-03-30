# == Class: liferay::config
#
#
class liferay::config (
  $admin_email_from_address,
  $admin_email_from_name   ,
  $hide_user_password_etc  ,
  $setup_wizard            ,
  $terms_of_use            ,
  $dbtype                  ,
  $custom_config           ,
  $https                   ,
) inherits liferay::params {

  $tomcatdriverClassName = $::liferay::params::dbconfig[$dbtype]['tomcatdriverClassName']
  $dbport =  $::liferay::params::dbconfig[$dbtype]['dbport']

  if(is_hash($custom_config)) {
    $custom_config_hash = $custom_config
  } else {
    $custom_config_hash = { }
  }

  if $https {
    $https_config_hash = {
      'web.server.protocol'  => 'https',
      'web.server.http.port' => '443',
    }
  } else {
    $https_config_hash = {}
  }

  $default_config_hash = {
    'admin.email.from.address' => $admin_email_from_address,
    'admin.email.from.name'    => $admin_email_from_name,
    'setup.wizard.enabled'     => $setup_wizard,
    'terms.of.use.required'    => $terms_of_use,
  }

  $portal_ext_properties_hash = merge($custom_config_hash, $https_config_hash, $default_config_hash)

  file {'/etc/tomcat7/catalina.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('liferay/etc/tomcat7/catalina.properties.erb'),
    require => Package['tomcat7'],
  }
  ->
  file { '/etc/tomcat7/Catalina':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  ->
  file { '/etc/tomcat7/Catalina/localhost':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  ->
  file {'/etc/tomcat7/Catalina/localhost/ROOT.xml':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('liferay/etc/tomcat7/Catalina/localhost/liferay-ROOT.xml.erb'),
  }
  ~>
  file {'/etc/default/tomcat7':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('liferay/etc/default/tomcat7.erb'),
  }
  file { '/var/lib/tomcat7/webapps/ROOT/WEB-INF/classes/portal-ext.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('liferay/var/lib/tomcat7/webapps/ROOT/WEB-INF/classes/portal-ext.properties.erb'),
    notify  => Service['tomcat7'],
  }

}

