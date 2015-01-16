name 'intltool'

default_version '0.40.6'

source url: "http://ftp.gnome.org/pub/gnome/sources/#{name}/#{version.gsub(/\.(\d+)$/, '')}/#{name}-#{version}.tar.gz",
       md5: '8e40f9d1c7308eddbfd24b22cd540631'

relative_path "#{name}-#{version}"

dependency 'perl'
dependency 'perl-xml-parser'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end
