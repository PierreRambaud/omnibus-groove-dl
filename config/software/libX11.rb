name 'libX11'
default_version '1.6.2'

source(url: "http://xorg.freedesktop.org/releases/individual/lib/#{name}-#{version}.tar.gz",
       md5: '7e17129e1678355d8268883ee31a6edf')

relative_path "#{name}-#{version}"

dependency 'libxcb'
dependency 'inputproto'
dependency 'kbproto'
dependency 'xtrans'
dependency 'util-macros'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded",
         '--without-xmlto'
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end
