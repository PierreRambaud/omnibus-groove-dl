name 'gtk'

default_version '3.15.3'

source(url: "https://github.com/GNOME/gtk/archive/#{version}.tar.gz",
       md5: '9a787068fb1c70387538baa81142bd7e')

dependency 'automake'
dependency 'autoconf'

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
