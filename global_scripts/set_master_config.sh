# This will modify the master config to point to the correct directory for state and pillar files

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

