name 'libxcb'
default_version '1.11'

source(url: "http://xcb.freedesktop.org/dist/libxcb-#{version}.tar.gz",
       md5: '1698dd837d7e6e94d029dbe8b3a82deb')

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
