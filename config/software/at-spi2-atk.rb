name 'at-spi2-atk'

default_version '2.15.3'

source url: "http://ftp.gnome.org/pub/gnome/sources/#{name}/#{version.gsub(/\.(\d+)$/, '')}/#{name}-#{version}.tar.xz",
       md5: 'fa77f95b38e6fbbbc07ed248a1c64922'

relative_path "#{name}-#{version}"

dependency 'dbus'
dependency 'at-spi2-core'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end
