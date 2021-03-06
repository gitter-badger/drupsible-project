#!/bin/bash
#
# Make backup of the current configuration
#
BACKUP_DIR_RAW="~/drupsible-backups"
BACKUP_DIR=${BACKUP_DIR_RAW/#\~/$HOME}
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILENAME="$1-$DATE.tar.gz"
if [ ! -d "${BACKUP_DIR}" ]; then
	mkdir "${BACKUP_DIR}"
fi
tar czvf "$BACKUP_DIR/$BACKUP_FILENAME" --exclude "*.default" --exclude "*default.profile" --exclude-vcs --exclude "*.gz" --exclude "*.zip" --exclude "lookup_plugins" --exclude "*example.com.yml" --exclude "README.*" "ansible" >/dev/null
if [ "$?" == 0 ]; then
	echo "Backup of your current config files stored in $BACKUP_DIR/$BACKUP_FILENAME"
else
	echo "Backup FAILED."
fi
