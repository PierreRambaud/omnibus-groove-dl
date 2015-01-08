name 'gobject-introspection'

default_version '1.42.0'

source url: "http://ftp.gnome.org/pub/gnome/sources/#{name}/#{version.gsub(/\.(\d+)$/, '')}/#{name}-#{version}.tar.xz",
       md5: '4fa52f6b67367d9c1b99b98683ced202'

relative_path "#{name}-#{version}"

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded",
         '--disable-gtk-doc'
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end
