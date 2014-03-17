node default {

  include java7

  # include jenkins
  class { 'jenkins':
    lts                      => true,
    install_java             => false,
    plugin_hash              => {
      'git'                  => { version => latest },
      'javadoc'              => { version => latest },
      'maven-plugin'         => { version => latest },
      'ant'                  => { version => latest },
      'subversion'           => { version => latest },
      'ivy'                  => { version => latest },
      'gradle'               => { version => latest },
      'artifactory'          => { version => latest },
      's3'                   => { version => latest },
      'grails'               => { version => latest },
      'translation'          => { version => latest },
      'publish-over-ssh'     => { version => latest },
      'github-api'           => { version => latest },
      'ssh-slaves'           => { version => latest },
      'github'               => { version => latest },
      'email-ext'            => { version => latest },
      'persona'              => { version => latest },
      'confluence-publisher' => { version => latest },
      'groovy'               => { version => latest },
      'chucknorris'          => { version => latest },
      'cvs'                  => { version => latest },
      'github-oauth'         => { version => latest },
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
