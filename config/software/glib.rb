name 'glib'

default_version '2.43.2'

source url: "http://ftp.gnome.org/pub/gnome/sources/glib/#{version.gsub(/\.(\d+)$/, '')}/glib-#{version}.tar.xz",
       md5: '9e0ecd1c3da6647735591575981aca7a'

relative_path "#{name}-#{version}"

dependency 'pkg-config'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded",
         '--with-libiconv'
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)
  env.merge!(
    'LDFLAGS' => "-L#{install_dir}/embedded/lib" \
    " -I#{install_dir}/embedded/include",
    'CFLAGS' => "-L#{install_dir}/embedded/lib" \
    " -I#{install_dir}/embedded/include",
    'LD_RUN_PATH' => "#{install_dir}/embedded/lib"
  )

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end
