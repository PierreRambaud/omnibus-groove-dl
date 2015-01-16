name 'gtk'

default_version '3.15.3'

source(url: "http://ftp.gnome.org/pub/gnome/sources/#{name}+/#{version.gsub(/\.(\d+)$/, '')}/#{name}+-#{version}.tar.xz",
       md5: '5a2e90dc89f3dd64012cd4b38284a115')

dependency 'pkg-config'
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
