name 'libxcb'
default_version '1.9'

source(url: "http://xcb.freedesktop.org/dist/libxcb-#{version}.tar.gz",
       md5: 'd92657d958dfd222a12f4e936a7a26c8')

dependency 'pkg-config'
dependency 'libtool'
dependency 'libxslt'
dependency 'libXau'
dependency 'libpthread-stubs'
dependency 'xcb-proto'

relative_path "#{name}-#{version}"

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end
