<?php
/* You can overwrite the $TUPA_CONF_VARS values in "lib/config_default.php" here
  *
  * If you want to change your default SOA Primary Server for example use this:
  * $TUPA_CONF_VARS['DNS']['defaultSoaPrimary']='your.nameserver.com';
  *
  * Or the default SOA eMail address
  * $TUPA_CONF_VARS['DNS']['defaultSoaHostmaster']='your@email-address.com';
  *
  * Or if you want to enable maintenance mode
  * $TUPA_CONF_VARS['SYS']['maintenanceEnabled']=true;
  *
  * They will be configurable over an interface in a later release.
  */

## INSTALLER EDIT POINT TOKEN - all lines after this points may be changed by the installer!

// md5 encoded installer password
$installer_password = '{INSTALLER_PASSWORD}';

// Database config
$tupa_db = '{DB_NAME}';
$tupa_db_host = '{DB_HOST}';
$tupa_db_port = '{DB_PORT}';
$tupa_db_username = '{DB_USERNAME}';
$tupa_db_password = '{DB_PASSWORD}';

// Default settings
$TUPA_CONF_VARS['DNS']['defaultTTL'] = '{DEFAULT_TTL}';
$TUPA_CONF_VARS['DNS']['defaultPrio'] = '{DEFAULT_PRIO}';
$TUPA_CONF_VARS['DNS']['defaultSoaPrimary'] = '{DEFAULT_SOA_PRIMARY}';
$TUPA_CONF_VARS['DNS']['defaultSoaHostmaster'] = '{DEFAULT_SOA_HOSTMASTER}';
$TUPA_CONF_VARS['DNS']['defaultSoaRefresh'] = '{DEFAULT_SOA_REFRESH}';
$TUPA_CONF_VARS['DNS']['defaultSoaRetry'] = '{DEFAULT_SOA_RETRY}';
$TUPA_CONF_VARS['DNS']['defaultSoaExpire'] = '{DEFAULT_SOA_EXPIRE}';
$TUPA_CONF_VARS['DNS']['defaultSoaTTL'] = '{DEFAULT_SOA_TTL}';
