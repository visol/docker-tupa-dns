#!/bin/bash
set -e


# Replace {key} with value
set_config() {
	key="$1"
	value="$2"
	php_escaped_value="$(php -r 'var_export($argv[1]);' "$value")"
	sed_escaped_value="$(echo "$php_escaped_value" | sed 's/[\/&]/\\&/g')"
	sed -ri "s/(['\"])?\{$key\}(['\"])?/$sed_escaped_value/" /var/www/html/config/config_site.inc.php
}


#
# database configuration
#

if [ -z "$MYSQL_PORT_3306_TCP" ]; then
	echo >&2 'error: missing MYSQL_PORT_3306_TCP environment variable'
	echo >&2 '  Did you forget to --link some_mysql_container:mysql ?'
	exit 1
fi

set_config 'DB_HOST' "$MYSQL_PORT_3306_TCP_ADDR"
set_config 'DB_PORT' "$MYSQL_PORT_3306_TCP_PORT"
set_config 'DB_NAME' "$MYSQL_ENV_MYSQL_DATABASE"
set_config 'DB_USERNAME' "$MYSQL_ENV_MYSQL_USER"
set_config 'DB_PASSWORD' "$MYSQL_ENV_MYSQL_PASSWORD"



#
# installer password
#

hash_password() {
	password="$1"
	php -r "echo(md5('${password}'));"
}


TUPA_INSTALLER_PASSWORD=${TUPA_INSTALLER_PASSWORD-"tupainstall"}

set_config 'INSTALLER_PASSWORD' "$(hash_password $TUPA_INSTALLER_PASSWORD)"



case "$1" in
	app:start)
		# Apache gets grumpy about PID files pre-existing
		rm -f /var/run/apache2/apache2.pid
		exec apache2 -DFOREGROUND
		;;
	*)
		if [ -x $1 ]; then
			$1
		else
			prog=$(which $1)
			if [ -n "${prog}" ] ; then
				shift 1
				$prog $@
			else
				appHelp
			fi
		fi
		;;
esac

exit 0
