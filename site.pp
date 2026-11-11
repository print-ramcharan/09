node 'puppet-agent' {
  file { '/tmp/puppet-agent-result.txt':
    ensure  => file,
    content => 'Puppet Agent configured by Puppet Server',
  }
}
