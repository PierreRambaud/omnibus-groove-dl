name 'xcb-proto'
default_version '1.11'

source(url: "http://xcb.freedesktop.org/dist/xcb-proto-#{version}.tar.gz",
       md5: 'c8c6cb72c84f58270f4db1f39607f66a')

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
