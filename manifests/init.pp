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
  $dbport                   = undef,
  $dbname                   = undef,
  $dbusername               = undef,
  $dbpassword               = undef,
  $tomcat_opts              = '-Xmx1024m -XX:MaxPermSize=256m',
  $admin_email_from_address = "root@${::fqdn}",
  $admin_email_from_name    = "root@${::fqdn}",
  $custom_config            = undef,
  $hide_user_password_etc   = false,
  $disallow_user_pages      = true,
  $setup_wizard             = true,
  $terms_of_use             = true,
  $https                    = false,
) inherits liferay::params {

  $picked_dbport = pick($dbport,$::liferay::params::dbconfig[$dbtype]['dbport'])

  class { 'liferay::tomcat7':
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
    disallow_user_pages      => $disallow_user_pages,
    setup_wizard             => $setup_wizard,
    terms_of_use             => $terms_of_use,
    dbtype                   => $dbtype,
    dbport                   => $picked_dbport,
    custom_config            => $custom_config,
    https                    => $https,
  }
  ~>
  class { 'liferay::service':
  }

}

