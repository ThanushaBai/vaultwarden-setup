#!/bin/bash
# Vaultwarden Backup Script
BACKUP_DIR="$HOME/vaultwarden-backups"
DATA_DIR="$HOME/vaultwarden-setup/vw-data"
DATE=$(date +\%F)

mkdir -p "$BACKUP_DIR"
tar -czvf "$BACKUP_DIR/backup-$DATE.tar.gz" -C "$HOME/vaultwarden-setup" vw-data
echo "Backup completed: $BACKUP_DIR/backup-$DATE.tar.gz"
