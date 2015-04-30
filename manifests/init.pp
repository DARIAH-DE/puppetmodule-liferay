# == Class: liferay
#
# Liferay portal
# https://www.liferay.com/
#
#
class liferay (
  $version                  = '6.2-ce-ga2',
  $java_version             = '7',
  $dbhost                   = 'localhost',
  $dbtype                   = 'mysql',
  $dbport                   = $liferay::params::dbport,
  $dbname                   = undef,
  $dbusername               = undef,
  $dbpassword               = undef,
  $tomcat_opts              = '-Xmx1024m -XX:MaxPermSize=256m',
  $admin_email_from_address = "root@${::fqdn}",
  $admin_email_from_name    = "root@${::fqdn}",
  $custom_config            = undef,
  $hide_user_password_etc   = false,
  $setup_wizard             = true,
  $terms_of_use             = true,
  $https                    = false,
) inherits liferay::params {

  class { 'tomcat7':
    java_version => $java_version,
  }
  ~>
  class { 'liferay::dependencies':
    version => $version,
  }
  ~>
  class { 'liferay::install':
    version => $version,
  }
  ~>
  class { 'liferay::config':
    admin_email_from_address => $admin_email_from_address,
    admin_email_from_name    => $admin_email_from_name,
    hide_user_password_etc   => $hide_user_password_etc,
    setup_wizard             => $setup_wizard,
    terms_of_use             => $terms_of_use,
    dbtype                   => $dbtype,
    dbport                   => $dbport,
    custom_config            => $custom_config,
    https                    => $https,
  }
  ~>
  class { 'liferay::service':
  }

}

