name 'libXdamage'
default_version '1.1'

source(url: "http://xorg.freedesktop.org/releases/individual/lib/#{name}-#{version}.tar.gz",
       md5: 'ed2b5e93165cad0378e79a04c744dcd7')

relative_path "#{name}-#{version}"

dependency 'libX11'
dependency 'damageproto'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end
