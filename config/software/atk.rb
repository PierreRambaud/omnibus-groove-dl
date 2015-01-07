name 'atk'

default_version '2.15.3'

source url: "http://ftp.gnome.org/pub/gnome/sources/atk/#{version.gsub(/\.(\d+)$/, '')}/atk-#{version}.tar.xz",
       md5: '4dc8f00682eeb6bcab3b9b2fd1f2378c'

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
