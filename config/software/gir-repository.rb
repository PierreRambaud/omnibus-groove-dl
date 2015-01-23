name 'gir-repository'

default_version '0.6.5'

source url: "http://ftp.gnome.org/pub/gnome/sources/#{name}/#{version.gsub(/\.(\d+)$/, '')}/#{name}-#{version}.tar.gz",
       md5: '817437694ac7bd0b240a4952a648991e'

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
