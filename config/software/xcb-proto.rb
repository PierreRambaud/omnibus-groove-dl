name 'xcb-proto'
default_version '1.8'

source(url: "http://xcb.freedesktop.org/dist/xcb-proto-#{version}.tar.gz",
       md5: '8d2cdb770129cef563088a90c5bec768')

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
