#!/bin/sh

# POSIX variable
OPTIND=1	#Reset in case getopts has been used previously in the shell

# Initialize option variables
force=0
master_config=""
verbose=0

# Option Handling
while getopts"h?fm:v" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    v)  verbose=1
        ;;
    m)  master_config=$OPTARG
        ;;
    f)  force=1
        ;;
    esac
done

# This will modify the master config to point to the correct directory for state and pillar files

echo "verbose option=$verbose; master_config option=$master_config; force option=$force"

if [ force==0 ]; then
    echo "Warning: This will replace any current custome config defined. If you are looking
 	 to modify current settings, please modify the master config directly.

         Continue?[y/N]"
    read -p change_settings
    if [ change_settings != 'y' ] || [ change_settings != 'Y' ]; then
       exit 1
    fi
fi

echo "Continuing with modifcations to master_config"
# Remove any existing custome config

# Append this information to bottom of file
cat <<EOT >> /etc/salt/master

#####       Custom Config       ######
######################################
file_roots:
  base:
    - /opt/srv/salt_fun/salt

pillar_roots:
  base:
    - /opt/srv/salt_fun/pillar
EOT

