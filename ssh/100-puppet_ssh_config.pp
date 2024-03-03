#!/bin/bash

cat <<EOF > 100-puppet_ssh_config.pp
file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/sshd_config',
  line  => 'PasswordAuthentication no',
}

file_line { 'Declare identity file':
  path  => '/etc/ssh/ssh_config',
  line  => 'IdentityFile ~/.ssh/school',
}
EOF

sudo puppet apply 100-puppet_ssh_config.pp
