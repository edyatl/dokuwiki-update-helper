# DokuWiki Update Helper

This script automates the process of upgrading DokuWiki by following the official [DokuWiki upgrade instructions](https://www.dokuwiki.org/install:upgrade). It performs a backup, downloads the latest stable release, unpacks the files, and updates the DokuWiki installation.

## Features

- **Backup:** Automatically creates a compressed backup of the existing DokuWiki installation.
- **Download:** Fetches the latest stable release from the official DokuWiki download site.
- **Upgrade:** Unpacks the release and copies the files to the existing DokuWiki directory, ensuring that the upgrade is performed safely.
- **File Cleanup:** Removes the downloaded tarball and temporary files after the upgrade.

## Prerequisites

- A working installation of DokuWiki.
- SSH access to the server where DokuWiki is installed.
- Basic knowledge of Linux command line.

## Usage

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/edyatl/dokuwiki-update-helper.git
   cd dokuwiki-update-helper
   ```

2. **Edit the Script (Optional):**
   - The script assumes that DokuWiki is installed in `/var/www/dokuwiki`. If your installation path is different, update the `DOKUWIKI_PATH` variable in the script.

3. **Run the Script:**
   ```bash
   ./dokuwiki_update.sh
   ```

   - The script will perform the following steps:
     1. Create a backup of your DokuWiki installation.
     2. Show the current DokuWiki version.
     3. Download the latest stable DokuWiki release.
     4. Unpack the release and copy the files to your DokuWiki directory.
     5. Update file ownership and permissions.
     6. Display the updated DokuWiki version.

4. **Verify the Update:**
   - After running the script, check your DokuWiki installation to ensure everything is functioning correctly.

## Important Notes

- The script assumes that the existing configuration is set up according to the official DokuWiki guidelines (e.g., configuration files are stored in `*.local` files).
- It is highly recommended to review the [changelog](https://www.dokuwiki.org/changes) before running the update, as some updates may require additional manual steps.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.


## Disclaimer

This script is provided as-is, without any warranties. Use at your own risk.