name 'kbproto'
default_version '1.0.6'

source(url: "http://xorg.freedesktop.org/releases/individual/proto/#{name}-#{version}.tar.gz",
       md5: '9c650b7947fe59b3f144518400e8d029')

relative_path "#{name}-#{version}"

dependency 'pkg-config'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end
