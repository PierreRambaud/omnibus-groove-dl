name 'pango'

default_version '1.36.8'

source(url: "http://ftp.gnome.org/pub/gnome/sources/#{name}/#{version.gsub(/\.(\d+)$/, '')}/#{name}-#{version}.tar.xz",
       md5: '217a9a753006275215fa9fa127760ece')

dependency 'pkg-config'
dependency 'fontconfig'
dependency 'harfbuzz'

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
