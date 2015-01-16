name 'at-spi2-core'

default_version '2.15.3'

source url: "http://ftp.gnome.org/pub/gnome/sources/#{name}/#{version.gsub(/\.(\d+)$/, '')}/#{name}-#{version}.tar.xz",
       md5: 'd54b3a1cd46c91a4037d3cdcfbab5623'

relative_path "#{name}-#{version}"

dependency 'intltool'
dependency 'libXtst'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end
