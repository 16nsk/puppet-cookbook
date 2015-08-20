node default {
  include memcached

  file { '/tmp/hello':
    content => "Hello, World!\n"
  }
}
