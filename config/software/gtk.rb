name 'gtk'

default_version '3.14.7'

source(url: "http://ftp.gnome.org/pub/gnome/sources/#{name}+/#{version.gsub(/\.(\d+)$/, '')}/#{name}+-#{version}.tar.xz",
       md5: '025938c2bc09fcc6173b5533681550ee')

dependency 'pkg-config'
dependency 'gir-repository'
dependency 'libXfixes'
dependency 'libXrandr'
dependency 'libXcursor'
dependency 'libXcomposite'
dependency 'libXinerama'
dependency 'libXi'
dependency 'gdk-pixbuf'
dependency 'pango'
dependency 'libepoxy'
dependency 'libexpat'
dependency 'at-spi2-atk'

relative_path "#{name}+-#{version}"

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end
