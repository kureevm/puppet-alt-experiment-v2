class alt_adapted {

  package { 'vim-console':
    ensure   => installed,
    provider => aptrpm,
  }

  package { 'openssh-server':
    ensure   => installed,
    provider => aptrpm,
  }

  service { 'sshd':
    ensure  => running,
    enable  => true,
    require => Package['openssh-server'],
  }

  file { '/etc/motd':
    ensure  => file,
    content => "System is managed by Puppet module for ALT Linux\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  exec { 'set_alt_control_su':
    command => '/usr/sbin/control su restricted',
    unless  => '/usr/sbin/control su | grep -q "^restricted$"',
    path    => ['/usr/bin', '/usr/sbin', '/bin', '/sbin'],
    returns => [0],
    timeout => 10,
  }
}
