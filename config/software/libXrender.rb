name 'libXrender'
default_version '0.9.8'

source(url: "http://xorg.freedesktop.org/releases/individual/lib/libXrender-#{version}.tar.gz",
       md5: '8be1c51f4425529617a5a43d5d192a31')

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
