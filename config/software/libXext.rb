name 'libXext'
default_version '1.3.3'

source(url: "http://xorg.freedesktop.org/releases/individual/lib/libXext-#{version}.tar.gz",
       md5: '5e3e75160ab6a8c212d0ecd82aa04651')

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
