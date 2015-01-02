name 'glib'

default_version '2.43.2'

source url: "http://ftp.gnome.org/pub/gnome/sources/glib/#{version.gsub(/\.(\d+)$/, '')}/glib-#{version}.tar.xz",
       md5: '9e0ecd1c3da6647735591575981aca7a'

relative_path "#{name}-#{version}"

dependency 'libiconv'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)
  command(cmd,
          env: env)
  command("make -j #{workers}",
          env: env)
  command('make install',
          env: env)
end
