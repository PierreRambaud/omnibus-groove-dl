name 'libxshmfence'
default_version '1.2'

source(url: "http://xorg.freedesktop.org/releases/individual/lib/#{name}-#{version}.tar.gz",
       md5: 'f0b30c0fc568b22ec524859ee28556f1')

relative_path "#{name}-#{version}"

dependency 'libX11'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end
