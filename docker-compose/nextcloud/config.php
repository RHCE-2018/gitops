<?php
$CONFIG = array (
  'htaccess.RewriteBase' => '/',
  'overwriteprotocol' => 'https',
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'apps_paths' => 
  array (
    0 => 
    array (
      'path' => '/var/www/html/apps',
      'url' => '/apps',
      'writable' => false,
    ),
    1 => 
    array (
      'path' => '/var/www/html/custom_apps',
      'url' => '/custom_apps',
      'writable' => true,
    ),
  ),
  'passwordsalt' => 'NHqGFxC2FG+P498Qhh0CsWFNYYlNeM',
  'secret' => 'EMsZiIRWGbSZhr235PtIMZd1JxGUorJIO+MODd4b33sFFN7Z',
  'trusted_domains' => 
  array (
    0 => '192.168.3.173',
    1 => 'drive.sinux.com',
  ),
  'datadirectory' => '/var/www/html/data',
  'dbtype' => 'pgsql',
  'version' => '19.0.5.2',
  'overwrite.cli.url' => 'http://192.168.3.173:8080/',
  'dbname' => 'postgres',
  'dbhost' => 'db',
  'dbport' => '',
  'dbtableprefix' => 'oc_',
  'dbuser' => 'oc_admin',
  'dbpassword' => 'ebctxwn9nmnp1tmhlaaqtg0qswgse5',
  'installed' => true,
  'instanceid' => 'ocmpav2vfd2z',
  'ldapIgnoreNamingRules' => false,
  'ldapProviderFactory' => 'OCA\\User_LDAP\\LDAPProviderFactory',
);
