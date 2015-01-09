name 'damageproto'
default_version '1.2.1'

source(url: "http://xorg.freedesktop.org/releases/individual/proto/#{name}-#{version}.tar.gz",
       md5: 'bf8c47b7f48625230cff155180f8ddce')

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
