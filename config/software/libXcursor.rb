name 'libXcursor'
default_version '1.1.14'

source(url: "http://xorg.freedesktop.org/releases/individual/lib/#{name}-#{version}.tar.gz",
       md5: '39c8423de190d64f1c52fbc00022e52c')

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
