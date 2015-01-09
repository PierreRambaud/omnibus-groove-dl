name 'inputproto'
default_version '2.3'

source(url: "http://xorg.freedesktop.org/releases/individual/proto/#{name}-#{version}.tar.gz",
       md5: '5ea366d32a9a78d6204a47ea35d9dc5c')

relative_path "#{name}-#{version}"

dependency 'pkg-config'
dependency 'xextproto'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end
