name 'xextproto'
default_version '7.3.0'

source(url: "http://xorg.freedesktop.org/releases/individual/proto/#{name}-#{version}.tar.gz",
       md5: '37b700baa8c8ea7964702d948dd13821')

relative_path "#{name}-#{version}"

dependency 'xorg-sgml-doctools'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end
