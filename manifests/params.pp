# == Class: liferay::params
#
class liferay::params {

  $downloadlinks = {
    '6.1-ce-ga2'                  => {
      'src_download_link'          => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.1.1%20GA2/liferay-portal-src-6.1.1-ce-ga2-20120731132656558.zip/download',
      'dependencies_download_link' => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.1.1%20GA2/liferay-portal-dependencies-6.1.1-ce-ga2-20120731132656558.zip/download',
      'release_download_link'      => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.1.1%20GA2/liferay-portal-6.1.1-ce-ga2-20120731132656558.war/download',
    },
    '6.1-ce-ga3'                  => {
      'src_download_link'          => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.1.2%20GA3/liferay-portal-src-6.1.2-ce-ga3-20130816114619181.zip/download',
      'dependencies_download_link' => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.1.2%20GA3/liferay-portal-dependencies-6.1.2-ce-ga3-20130816114619181.zip/download',
      'release_download_link'      => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.1.2%20GA3/liferay-portal-6.1.2-ce-ga3-20130816114619181.war/download',
    },

    '6.2-ce-ga1'                  => {
      'src_download_link'          => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.0%20GA1/liferay-portal-src-6.2.0-ce-ga1-20131101192857659.zip/download',
      'dependencies_download_link' => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.0%20GA1/liferay-portal-dependencies-6.2.0-ce-ga1-20131101192857659.zip/download',
      'release_download_link'      => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.0%20GA1/liferay-portal-6.2.0-ce-ga1-20131101192857659.war/download',
    },
    '6.2-ce-ga2'                  => {
      'src_download_link'          => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.1%20GA2/liferay-portal-src-6.2-ce-ga2-20140319114139101.zip/download',
      'dependencies_download_link' => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.1%20GA2/liferay-portal-dependencies-6.2-ce-ga2-20140319114139101.zip/download',
      'release_download_link'      => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.1%20GA2/liferay-portal-6.2-ce-ga2-20140319114139101.war/download',
    },
    '6.2-ce-ga3'                  => {
      'src_download_link'          => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.2%20GA3/liferay-portal-src-6.2-ce-ga3-20150103155803016.zip/download',
      'dependencies_download_link' => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.2%20GA3/liferay-portal-dependencies-6.2-ce-ga3-20150103155803016.zip/download',
      'release_download_link'      => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.2%20GA3/liferay-portal-6.2-ce-ga3-20150103155803016.war/download',
    },
     '6.2-ce-ga4'                  => {
      'src_download_link'          => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.3%20GA4/liferay-portal-src-6.2-ce-ga4-20150416163831865.zip/download',
      'dependencies_download_link' => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.3%20GA4/liferay-portal-dependencies-6.2-ce-ga4-20150416163831865.zip/download',
      'release_download_link'      => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.3%20GA4/liferay-portal-6.2-ce-ga4-20150416163831865.war/download',
    }
  }

  $dbconfig = {
    'mysql'                   => {
      'dbport'                => '3306',
      'tomcatdriverClassName' => 'com.mysql.jdbc.Driver',
    },
    'postgresql'              => {
      'dbport'                => '5432',
      'tomcatdriverClassName' => 'org.postgresql.Driver',
    }
  }

}

