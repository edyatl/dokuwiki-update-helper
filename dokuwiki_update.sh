#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Constants
DOKUWIKI_PATH="/var/www/dokuwiki"

# 1. Change current directory to $HOME
cd $HOME

# 2. Check and create backup directory if not exists
backup_dir="$HOME/dokuwiki-bak"
if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
fi

# 3. Make a backup file
backup_file="$backup_dir/dokuwiki-backup-$(date +%Y-%m-%d).tar.gz"
tar -czvf "$backup_file" "$DOKUWIKI_PATH" || exit 1

# 4. Show current DokuWiki version
if [ -f "$DOKUWIKI_PATH/VERSION" ]; then
    echo "Current DokuWiki version:"
    cat "$DOKUWIKI_PATH/VERSION"
else
    echo "VERSION file not found! Exiting..."
    exit 1
fi

# 5. Download current stable release
wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz || exit 1

# 6. Unpack tarball
tar zxvf dokuwiki-stable.tgz || exit 1

# 7. Identify the correct unpacked directory
unpacked_dir=$(ls -d dokuwiki-[0-9]*)

# 8. Verify unpacked directory exists
if [ -d "$unpacked_dir" ]; then
    # Copy files to /var/www/dokuwiki/
    cp -af "$unpacked_dir"/* "$DOKUWIKI_PATH/" || exit 1
else
    echo "Unpacked directory not found! Exiting..."
    exit 1
fi

# 9. Change ownership
chown -R www-data:www-data "$DOKUWIKI_PATH" || exit 1

# 10. Remove tarball and unpacked directory
rm dokuwiki-stable.tgz || exit 1
rm -rf "$unpacked_dir" || exit 1

# 11. Show updated DokuWiki version
if [ -f "$DOKUWIKI_PATH/VERSION" ]; then
    echo "Updated DokuWiki version:"
    cat "$DOKUWIKI_PATH/VERSION"
else
    echo "VERSION file not found after update! Something might have gone wrong."
    exit 1
fi

