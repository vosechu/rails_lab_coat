# puppet config to set up rails

# Make sure apt-get -y update runs before anything else.
stage { 'preinstall':
  before => Stage['main']
}

# updates AND upgrades box (for weekly updates)
class apt_get_update {
  exec { '/usr/bin/apt-get -y update && /usr/bin/apt-get -y dist-upgrade':
    user => 'root'
  }
}

class { 'apt_get_update':
  stage => preinstall
}

package { [ 'build-essential', 
'zlib1g-dev', 
'libssl-dev', 
'libreadline-dev', 
'git-core', 
'libxml2', 
'libxml2-dev', 
'libxslt1-dev',
'sqlite3',
'libsqlite3-dev',
'nodejs']:
ensure => installed,
}

# RMagick system dependencies
package { ['libmagickwand4', 'libmagickwand-dev']:
ensure => installed,
}
