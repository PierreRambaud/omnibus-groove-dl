name 'gdk-pixbuf'

default_version '2.31.2'

source(url: "http://ftp.gnome.org/pub/gnome/sources/#{name}/#{version.gsub(/\.(\d+)$/, '')}/#{name}-#{version}.tar.xz",
       md5: '6be6bbc4f356d4b79ab4226860ab8523')

dependency 'pkg-config'
dependency 'libpng'

relative_path "#{name}-#{version}"

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded",
         '--without-libjpeg',
         '--without-libtiff'
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end
