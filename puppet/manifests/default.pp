node default {

  include java7

  class { 'jenkins':
    lts                      => false,
    install_java             => false,
    plugin_hash              => {
      'ant'                  => { version => '1.2' },
      'artifactory'          => { version => '2.2.1' },
      'chucknorris'          => { version => '0.5' },
      'config-file-provider' => { version => '2.7.1' },
      'confluence-publisher' => { version => '1.8' },
      'credentials'          => { version => '1.10' },
      'cvs'                  => { version => '2.11' },
      'email-ext'            => { version => '2.37.2.2' },
      'github-api'           => { version => '1.44' },
      'github-oauth'         => { version => '0.14' },
      'github'               => { version => '1.8' },
      'git'                  => { version => '2.0.4' },
      'git-client'           => { version => '1.6.4' },
      'gradle'               => { version => '1.23' },
      'grails'               => { version => '1.7' },
      'groovy'               => { version => '1.15' },
      'ivy'                  => { version => '1.23.2' },
      'javadoc'              => { version => '1.1' },
      'ldap'                 => { version => '1.8' },
      'mailer'               => { version => '1.8' },
      'maven-plugin'         => { version => '2.0.3' },
      'persona'              => { version => '2.4' },
      'publish-over-ssh'     => { version => '1.11' },
      'scm-api'              => { version => '0.2' },
      's3'                   => { version => '0.5' },
      'ssh-credentials'      => { version => '1.6.1' },
      'ssh-slaves'           => { version => '1.6' },
      'subversion'           => { version => '2.2' },
      'translation'          => { version => '1.11' },
      'token-macro'          => { version => '1.10' },
    },
    config_hash              => {
      'JAVA_ARGS'            => {
        'value'              =>
          '-Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Xmx1024m'
      },
    }
  }

  class { 'nginx':
    confd_purge => true,
  }

  nginx::resource::upstream { 'jenkins-real':
    ensure  => present,
    members => [
      'localhost:8080',
    ]
  }

  nginx::resource::vhost { 'jenkins-frontend':
    ensure      => present,
    proxy       => 'http://jenkins-real',
    server_name => [
      'localhost',
      'green.spantree.net',
    ],
  }

  package { 'mc':
    ensure => present,
  }
}

